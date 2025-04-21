Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37E8347C7
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 02:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204389; cv=none; b=CzFqiOHYdjkbEPWxp4BSKdR2voMlsvnx4Jb/4L3XUXoK9RSf1UeYlfFAbrbOzTEQ05YuE9yX9McgLvhkzqWESurbcdV71V6g3mTxvzXZWR1MLrhPZSjqxyI8hc9YzZgt2T06u83tPMtGTfdyCnioBwBNYpAIOSD1lRyYE2e0h9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204389; c=relaxed/simple;
	bh=BRo4cPV/aja+GSrhiv9kzgjCMywyMKThFNhuXRu5/fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+0+HUFvF/BS39NXsNyF5nPcZEL0S6H46/g4qtBMuTw4IYGKbzAiIAMaS91R04EzgAYByXqFpRliucLk967TotSqaUZRKQkXxKBiRWleknBVkNfIk00iOKiNSp1k8BS3xnfYvXrJLP3MkSOGJ71oXh6UsR5U5Ek58ofwuwi3gQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rSvHL+jt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rSvHL+jt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A298C4CEE2
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 02:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745204389;
	bh=BRo4cPV/aja+GSrhiv9kzgjCMywyMKThFNhuXRu5/fE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rSvHL+jtZo/DBeSUmIq/4O2y1q5Y5j0SnR2rNIgKQMl/1rb8oYyRwkw99cPm9smg2
	 G5+xO8rcz/9wxB1rAvb1cLiC/mmyNmRD1faBeNRIKbrZwtYP+rfqdpMF0pUOvcw11k
	 0gf8GVeTOtbefh93hCHBcf5lkYrx5fHDE+VPuh/B4mCE7YJtAM/vwWHKvYCVzotUd/
	 slK89UbNRRS8Jvc5ZQi+NiLBvUSt3bjdMNDuQKXMpwbmOIJIRzYtgqXZELF2n066GJ
	 0fnezxJdJYhh6mJpiDN8ucK7O6VDkGl+TW56ePddTlO+KNEnzkZKG3PcvvU3e97NFv
	 SyqM55S5RbGYA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so3750491a12.2
        for <loongarch@lists.linux.dev>; Sun, 20 Apr 2025 19:59:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YwlEyAdT9drXdBWKfef76HZwgm77ScSBOXlq2sL8f50s2SGgv0r
	ptTlY08WK/31BvzncEz5tyYGfo6qsupSLmMUvvhxE/xWnUG8auXl/Lpdf19IL2EtXRWMkyadR8E
	Z+cCBBxTe6jMkdGs7wHIkCj3K1K4=
X-Google-Smtp-Source: AGHT+IE7zvAQDvJiS0qNnUsCjptmrmBiRWsexsab+7QdMj9t6H/J+yNsQzLZ8V0zXY+UCIkV7fhy7VNxPweR3752nHU=
X-Received: by 2002:a05:6402:3547:b0:5f4:d38a:ee1a with SMTP id
 4fb4d7f45d1cf-5f62857911fmr7875174a12.14.1745204387868; Sun, 20 Apr 2025
 19:59:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250421020301.34185-1-youling.tang@linux.dev> <20250421020301.34185-3-youling.tang@linux.dev>
In-Reply-To: <20250421020301.34185-3-youling.tang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Apr 2025 10:59:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6AkHULnNgL3YH1ni1J+e0R06CRD=saWcVE7i_+QegBOA@mail.gmail.com>
X-Gm-Features: ATxdqUF_j0yeH3AF1IP5pYAjZK9eaZuoyCqTJ6tJuGugUsRbvmW0ttgZb4NbX38
Message-ID: <CAAhV-H6AkHULnNgL3YH1ni1J+e0R06CRD=saWcVE7i_+QegBOA@mail.gmail.com>
Subject: Re: [PATCH 3/3] LoongArch: Add some annotations in archhelp
To: Youling Tang <youling.tang@linux.dev>
Cc: loongarch@lists.linux.dev, Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Youling,

On Mon, Apr 21, 2025 at 10:03=E2=80=AFAM Youling Tang <youling.tang@linux.d=
ev> wrote:
>
> From: Youling Tang <tangyouling@kylinos.cn>
>
> - Add annotations to the kernel image.
> - Modify the annotations of insatll.
>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> ---
>  arch/loongarch/Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 64bdb52ddf7c..5711fe0efa76 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -184,6 +184,11 @@ install:
>         $(call cmd,install)
>
>  define archhelp
> -       echo '  install              - install kernel into $(INSTALL_PATH=
)'
> +       echo '  vmlinux.elf          - Uncompressed ELF kernel image (arc=
h/loongarch/boot/vmlinux.elf)'
> +       echo '  vmlinux.efi          - Uncompressed EFI kernel image (arc=
h/loongarch/boot/vmlinux.efi)'
Replace "Uncompressed" with "Normal"? Because you use "normal" in the 2nd p=
atch.

Huacai

> +       echo '  vmlinuz.efi          - Compressed EFI kernel image (arch/=
loongarch/boot/vmlinuz.efi)'
> +       echo '                         Default when CONFIG_EFI_ZBOOT=3Dy'
> +       echo '  install              - Install kernel using (your) ~/bin/=
$(INSTALLKERNEL) or (distribution)'
> +       echo '                         /sbin/$(INSTALLKERNEL) or install.=
sh to $$(INSTALL_PATH)'
>         echo
>  endef
> --
> 2.38.1
>
>
