import 'package:flutter/material.dart';
import 'dart:ui';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final double blur;
  final Color? color;
  final Border? border;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.blur = 20.0,
    this.color,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        border: border ?? Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color?.withOpacity(0.2) ?? Colors.white.withOpacity(0.1),
                  color?.withOpacity(0.1) ?? Colors.white.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final List<Color>? colors;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;
  final Widget? icon;

  const GradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.colors,
    this.width,
    this.height,
    this.padding,
    this.textStyle,
    this.borderRadius,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 50,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: colors ?? [
            const Color(0xFF6C5CE7),
            const Color(0xFFA29BFE),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: (colors?.first ?? const Color(0xFF6C5CE7)).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: (borderRadius ?? BorderRadius.circular(25)) as BorderRadius?,
          onTap: onPressed,
          child: Container(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 8),
                ],
                Text(
                  text,
                  style: textStyle ?? const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;
  final List<Color>? colors;
  final Duration duration;

  const AnimatedGradientBackground({
    super.key,
    required this.child,
    this.colors,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<AnimatedGradientBackground> createState() => _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.colors ?? [
                const Color(0xFF0F0F23),
                const Color(0xFF1A1A2E),
                const Color(0xFF16213E),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              transform: GradientRotation(_animation.value * 2 * 3.14159),
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}

class ShimmerWidget extends StatefulWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration duration;

  const ShimmerWidget({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                widget.baseColor ?? Colors.grey[300]!,
                widget.highlightColor ?? Colors.grey[100]!,
                widget.baseColor ?? Colors.grey[300]!,
              ],
              stops: [
                (_animation.value - 1).clamp(0.0, 1.0),
                _animation.value.clamp(0.0, 1.0),
                (_animation.value + 1).clamp(0.0, 1.0),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}