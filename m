Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E1192B97
	for <loongarch@lists.linux.dev>; Fri, 16 Aug 2024 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723805107; cv=none; b=O011B4rz7HPdKfYf1irmtzOqDkiS78Zz1hQjJbZE330wNjvuThuxnCO45LAb/d2QWMwuhwZZL1dENteDjkWZ8ngn0qe1Xt/wUzpgsWGjfHkyh5Njw1agiLbX/VWdQKi+d1tIWwX9V4HWSmFWal9SWCQtSldYitHy2V8s+mZ55/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723805107; c=relaxed/simple;
	bh=TuI+3JNN/KVJjGPeIeWqNHx4YCm3oM0eyYi9XN8BW70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfiyCqs1ZX3G7KDyYLroQBfWARtDU8i6+iRdWU4C//auX8rltCqOdM7ekwKcMTUuLKPLOxr5/hNUBAS4hKYajko/nFlrsIEKiJntak1VhgEi+cFk/qGHF5Vws+u+kAmiGGGsZowOF8Mj3TqQ8DdJj4KvHwxqqmalPFmmKJ8MDpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=GiJ/Y5Gi; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="GiJ/Y5Gi"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-39834949e42so6967815ab.1
        for <loongarch@lists.linux.dev>; Fri, 16 Aug 2024 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1723805105; x=1724409905; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQ76OrJ+D6EglboDmRkksAWPF9+ReWU1C7wwydHo8w8=;
        b=GiJ/Y5GiJdySiDUUiO8cXn9mHRir17cMOAF3dD3zEwxOvqSuuXCEfpi6jYe6kZbnw3
         lMBCUAITvca0IIllugXhERfAFaK0721I48XntvVRbvl9noyn7/gSpwnG520wNJDEHCfL
         cA5ChAldoQr1RUGQHA1tmtbxSuJOA2laIz1tKpIT6wLcUfDgb/r8/okqPC0eo68DgJWQ
         oqoc+ux+02Y7mDHf0IoXCa2f/gnlzNLh9iU5wPLmPDHw+o1UK0vQ8Nr4YMwKceBMqCCo
         xRuCQ16ZYiSGuVZUzI+g7bK0Iz+j91jR2BXodJfwTmz8pcYP3m3OeG5yqQ7xsGpQ191I
         C+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723805105; x=1724409905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQ76OrJ+D6EglboDmRkksAWPF9+ReWU1C7wwydHo8w8=;
        b=T2uApQOLY8iTXgEs1WAifO/5o9ykSATO5jT5AztVNUVpwcjs1s9yoGOlcQQ+3Ir2kV
         sUzWc/5YwEnXJMa7zImPEWolWaxyiAcdGWzC22opiAqBWsKomGRdKKZ4zwcUi7Tc9KZP
         EAJbRRLHKZB1cA0lFIADxF98zXMGYWt/W26KrmcawCeeqpjoOp3VdJoBR1EaSXzsjwUN
         1XNGzd8igy8Q/yzvXqKBrfP/rTWLFUZHrSni/0Y1UVaIn9MeMVRA7PHpPGMECk2P99XF
         jAk8AALBN/XGRWjFRcBGCmaVbO9Y5DuGIZE1mhGgS5jsPk484540EAxPE2dEHNb5IiCn
         cLKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkyNLoNlX0gZmJmwBp1caxAd3rNWCty7oRYY5HaD+Dy0wXIiBn496nh1aAzzkYr81+WllOoZjS/65HIXd6omhYLaAVLcYdSYqR
X-Gm-Message-State: AOJu0YyeTQh1qFOh9cTlWRJ4pBcNqoEpE1C2WOjWkIW/NSg/e7m8+WRS
	XgL+wIn5oHr7wy0a6t3HAnNi50We3eseZyM/nu4emJEdpTk8kkRRk53XAqdF4Dkg5gjW+tMMUU3
	dExi1/HtUjzvvT9jwW9bsTOwVJk6LMeUdWVFib8QuBu4d0nVk
X-Google-Smtp-Source: AGHT+IGOY2wZxg3oQyKstZDxzeAo3jAK3M41BK/FipMiQ0FhdiHyS6sxut/JjEf5JetJ4eJZeTSIb18KGPl1+eyfyBU=
X-Received: by 2002:a05:6e02:13a6:b0:39a:ea20:bf7f with SMTP id
 e9e14a558f8ab-39d26d791ccmr34640735ab.25.1723805104686; Fri, 16 Aug 2024
 03:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240816095520.96348-2-ajones@ventanamicro.com>
In-Reply-To: <20240816095520.96348-2-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Aug 2024 16:14:52 +0530
Message-ID: <CAAhSdy0wxpDXoUmGyuQOeMfNCubdp9_iYdBOSN=EcweG1nkwwg@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Support #msi-cells=<0> in of_msi_get_domain
To: Andrew Jones <ajones@ventanamicro.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, maz@kernel.org, 
	mark.rutland@arm.com, robh@kernel.org, saravanak@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 3:25=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> An 'msi-parent' property with a single entry and no accompanying
> '#msi-cells' property is considered the legacy definition as opposed
> to its definition after being expanded with commit 126b16e2ad98
> ("Docs: dt: add generic MSI bindings"). However, the legacy
> definition is completely compatible with the current definition and,
> since of_phandle_iterator_next() tolerates missing and present-but-
> zero *cells properties since commit e42ee61017f5 ("of: Let
> of_for_each_phandle fallback to non-negative cell_count"), there's no
> need anymore to special case the legacy definition in
> of_msi_get_domain().
>
> Indeed, special casing has turned out to be harmful, because, as of
> commit 7c025238b47a ("dt-bindings: irqchip: Describe the IMX MU block
> as a MSI controller"), MSI controller DT bindings have started
> specifying '#msi-cells' as a required property (even when the value
> must be zero) as an effort to make the bindings more explicit. But,
> since the special casing of 'msi-parent' only uses the existence of
> '#msi-cells' for its heuristic, and not whether or not it's also
> nonzero, the legacy path is not taken. Furthermore, the path to
> support the new, broader definition isn't taken either since that
> path has been restricted to the platform-msi bus.
>
> But, neither the definition of 'msi-parent' nor the definition of
> '#msi-cells' is platform-msi-specific (the platform-msi bus was just
> the first bus that needed '#msi-cells'), so remove both the special
> casing and the restriction. This not only simplifies the code but
> also resolves an issue with PCI devices finding their MSI controllers
> on riscv, as the riscv,imsics binding requires '#msi-cells=3D<0>'.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  drivers/of/irq.c | 37 +++++++++++--------------------------
>  1 file changed, 11 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index c94203ce65bb..026b52c8ee63 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -709,8 +709,7 @@ struct irq_domain *of_msi_map_get_device_domain(struc=
t device *dev, u32 id,
>   * @np: device node for @dev
>   * @token: bus type for this domain
>   *
> - * Parse the msi-parent property (both the simple and the complex
> - * versions), and returns the corresponding MSI domain.
> + * Parse the msi-parent property and returns the corresponding MSI domai=
n.
>   *
>   * Returns: the MSI domain for this device (or NULL on failure).
>   */
> @@ -718,33 +717,19 @@ struct irq_domain *of_msi_get_domain(struct device =
*dev,
>                                      struct device_node *np,
>                                      enum irq_domain_bus_token token)
>  {
> -       struct device_node *msi_np;
> +       struct of_phandle_args args;
>         struct irq_domain *d;
> +       int index =3D 0;
>
> -       /* Check for a single msi-parent property */
> -       msi_np =3D of_parse_phandle(np, "msi-parent", 0);
> -       if (msi_np && !of_property_read_bool(msi_np, "#msi-cells")) {
> -               d =3D irq_find_matching_host(msi_np, token);
> -               if (!d)
> -                       of_node_put(msi_np);
> -               return d;
> -       }

Dropping this special case of single msi-parent property breaks
RISC-V KVM guest created using KVMTOOl with AIA available
on the host.

Let's not drop this special case.

> -
> -       if (token =3D=3D DOMAIN_BUS_PLATFORM_MSI) {
> -               /* Check for the complex msi-parent version */
> -               struct of_phandle_args args;
> -               int index =3D 0;
> +       while (!of_parse_phandle_with_args(np, "msi-parent",
> +                                          "#msi-cells",
> +                                          index, &args)) {
> +               d =3D irq_find_matching_host(args.np, token);
> +               if (d)
> +                       return d;
>
> -               while (!of_parse_phandle_with_args(np, "msi-parent",
> -                                                  "#msi-cells",
> -                                                  index, &args)) {
> -                       d =3D irq_find_matching_host(args.np, token);
> -                       if (d)
> -                               return d;
> -
> -                       of_node_put(args.np);
> -                       index++;
> -               }
> +               of_node_put(args.np);
> +               index++;
>         }
>
>         return NULL;
> --
> 2.45.2
>
>

Regards,
Anup
