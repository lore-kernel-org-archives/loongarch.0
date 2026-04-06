Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3123845D1
	for <loongarch@lists.linux.dev>; Mon,  6 Apr 2026 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486682; cv=none; b=QLEZETbfkF5U89P3ZqnJLNT/NyRctLAtNjQ6+LGIstUNhpNGR+trCCJg131McjTeXz/YnUkTIQHCbyGeULI17KB426Dfk8xa2vvyKNsyarHOit7mGzjnQudzfWcmCylGOGZOOFsTJJmtfhjwG4EOtFQj048kS4Ap/x1Iz08NbJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486682; c=relaxed/simple;
	bh=v3Irs1NIPTFYJcSHAF9iC7cgfpGgGTjEhxGID1fhyuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUYjczYAj2gEXnDGs+QxWWYR9gRivvQ+nbeki8Yncj4EnCkTAOxLZDoTwKYlfZBqU0MhfBoUqk00mWcVgRJ1GR+oToCk3VaaBELZiyCx601ypbZ6Jt3IlWJT3TMk9CAgV/reDPiOla9JM/5AoesuSP9dZR5WPqdbWvEFeiX6ho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOfKdZBb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOfKdZBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE46C2BCB2
	for <loongarch@lists.linux.dev>; Mon,  6 Apr 2026 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775486682;
	bh=v3Irs1NIPTFYJcSHAF9iC7cgfpGgGTjEhxGID1fhyuk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GOfKdZBbv4S66syU6dhoHPXzX8cX4iKWHXyNW5ItaX6XXNvuMkN/lXQkBvyj1BkxQ
	 KEKHtyHOa5pHl+GVJQCsXR+1L5NnI1/m+rQTGC/o/ZGIrox2aKzW7jYmZQue7P77Xr
	 Hyb11FfJUsY1enoLF9j4h5wqqSv4xTDUGJx0CyVgTcvx0sgVFX2A7K3gxGilABj655
	 91K92Vu3eXRLSvWNHIkjrrXc+s67sJS969GdkKaK503EEMFrAvCdGrQvz8NnvpX/gt
	 1ajMXjjjPi/BSu+9tI8glwcisB7xvXr9ByPINqoxEhVm9M47Le287ETqdkKQMsBaIa
	 UyzO/pznaDrfw==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-68481c9e067so476500eaf.0
        for <loongarch@lists.linux.dev>; Mon, 06 Apr 2026 07:44:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMD7N5P3HugntenND8k4pbWrkuoNa9/yK34esHrLzGHaVLiZ/Bh3M7oVzH6HQh0NeiTLDK8fe86p8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy02/fbJu7g8l9Kki4FYMiNRuyZp4kSI3BTzgW26rR+zv66myFO
	pVBqHsNVwd7aKCgyNNgXYaBOPMEzhDGTWUVj33bXaU22GaOHPJm3lqJfOhXV3djtckKSzgXXFYW
	Sjh4kZ7Am8q1e1GXXb1JT62yWQxCsvWk=
X-Received: by 2002:a05:6820:174e:b0:67e:cc7:ccf5 with SMTP id
 006d021491bc7-6821e869e70mr6882008eaf.9.1775486681131; Mon, 06 Apr 2026
 07:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401135311.1737958-2-xry111@xry111.site>
In-Reply-To: <20260401135311.1737958-2-xry111@xry111.site>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 6 Apr 2026 16:44:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iL-XZaUwgan-j6ctG=r461BTyGc6cTBAK=Mr0v12WwgA@mail.gmail.com>
X-Gm-Features: AQROBzDsZRUsUtASikqhmQYyvIbvNieZ4PnJ2nc1p7aEvrgNQ_ZD3EbS3dZpXdc
Message-ID: <CAJZ5v0iL-XZaUwgan-j6ctG=r461BTyGc6cTBAK=Mr0v12WwgA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: Enable FPDT on LoongArch
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Zixing Liu <liushuyu@aosc.io>, Mingcong Bai <jeffbai@aosc.io>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 3:55=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrote=
:
>
> FPDT provides system- and application-readable performance statistics,
> useful for profiling and analyzing boot-time performance. FPDT table
> support is now available as a pending patch at the EDK II upstream [1]
> and has been tested on real hardware such as Loongson XA61200_V1.1 and
> XB612B0_V1.2 with patched firmware.
>
> We have also cross checked systemd-analyze(1) against a stop watch and
> the `dp' command in EFI Shell to see that the timing information are
> correct.
>
> Now that the functionality of FPDT is verified on LoongArch hardware,
> list LOONGARCH as a possible dependency, allowing it to be enabled.
>
> Link: https://github.com/tianocore/edk2/pull/12378 [1]
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  drivers/acpi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index 6f4b545f7377..f165d14cf61a 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -96,7 +96,7 @@ config ACPI_SPCR_TABLE
>
>  config ACPI_FPDT
>         bool "ACPI Firmware Performance Data Table (FPDT) support"
> -       depends on X86_64 || ARM64
> +       depends on X86_64 || ARM64 || LOONGARCH
>         help
>           Enable support for the Firmware Performance Data Table (FPDT).
>           This table provides information on the timing of the system
> --

Applied as 7.1 material, thanks!
