Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D33189514
	for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724682143; cv=none; b=Ld4FjFd1uolohLN4uS/4Tgaeuvgkw7157aznxRASQHee3ZTGD39YlBJePR9wd8VijGhF85XzDcuVKy5EvdM3cSDQaz5Bgw6hw1C1feeKc/u1P+rI4zN5Qq3srXoC3b3MQ1GIQ/bz/hVXMk15cOL9BhGbttFL7NwcUOCS6QMmrjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724682143; c=relaxed/simple;
	bh=xz3aRYwMXA618jFqf0NVBQJRwlEPu6nZdB1bFkbZmg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQvznlN+rCoWI5bk4AJdMQxF1buf9aVaA/0P8rSBM9kqAtEIyhF0FLCJNIBJioC/vHdbu46jr0ZCjXq0AD4/gXpQBplW8MLBy+1gXjuYjNw648rPymp/VzSoXuTCddobEEOIvL/dw0DS5WxPNk5yO/jkfslf6zMlQ9w+3Rk888Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/u3iCeB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/u3iCeB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB8BC52FCD
	for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 14:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724682143;
	bh=xz3aRYwMXA618jFqf0NVBQJRwlEPu6nZdB1bFkbZmg8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q/u3iCeBrPyg67jogt2Qqw+mf2PJbfGVPiG6np5qPNYtm6g4OlmDWZKBM3JmllkaH
	 B2id41vd5F/2SGgWsNWBiqJ8kebgYoza0P2E5jTuRJEih8hWNVhHef2xjUKzADKC87
	 Qvxrlg6C4vhKJdhvfBqZEwINXBQ9KXUwqTKkamfGuxapQXftd/jsDGtdEovyamZ1k3
	 KJlCBoMj9tiuBrnzGwln1bVzpp+QLwk7ZkBsJpdAB9SUNGV2OKhhZiqM2cYOn7m11g
	 MjfP+FX6kqqIbIEYPn5NXUg9ySUDyF69kjhUWtyAPa9yHVXd2KNxg0TbCXwleOkwWt
	 eyvqwAPvFdpsw==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5befd2f35bfso4965237a12.2
        for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 07:22:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVy2IV1gLxh8jEiX99AQrid847FLFw+uGPYBk9o3FPfCslnjypzqNTjG+wxw1Df/Iwe5NP0yZglysQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmfvFtcFaw/5txQNZCWJrEm/pahTl5V/OzgdqthdkX9rF5ifmz
	jgP26blnVd9Mibypg8MA7j/8kQ4db3yNjDWnef2EPbc6SuIT6Jl/XPMahOeYsy53mHv1t35OYp9
	WOB5WBvViF5em5CnxsqfMcoVnghQ=
X-Google-Smtp-Source: AGHT+IEj4OB/8sGaOW0rTp8kOIFnsdmiE2yVpgdg2UO1vXBiO60Kvop9QLAw5CH9jNH06fgfYHTWBzpRE3D8VjDKMoo=
X-Received: by 2002:a05:6402:2694:b0:5be:fde4:4380 with SMTP id
 4fb4d7f45d1cf-5c0891a2800mr6388888a12.24.1724682142076; Mon, 26 Aug 2024
 07:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820123731.31568-1-yangtiezhu@loongson.cn> <20240820123731.31568-3-yangtiezhu@loongson.cn>
In-Reply-To: <20240820123731.31568-3-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 26 Aug 2024 22:22:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4X_cBNykL8Q2X_RbGBpUdTcNWDwDYejRXe_yYT8A_4yw@mail.gmail.com>
Message-ID: <CAAhV-H4X_cBNykL8Q2X_RbGBpUdTcNWDwDYejRXe_yYT8A_4yw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: Add ifdefs to fix LSX and LASX related issues
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Aug 20, 2024 at 8:37=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> There exist some issues when building kernel if CONFIG_CPU_HAS_LBT is set
> but CONFIG_CPU_HAS_LSX and CONFIG_CPU_HAS_LASX are not set. In this case,
> there are no definitions of _restore_lsx and _restore_lasx and there are
> also no definitions of kvm_restore_lsx and kvm_restore_lasx in fpu.S and
> switch.S respectively, just add some ifdefs to fix the issues.
>
>   AS      arch/loongarch/kernel/fpu.o
> arch/loongarch/kernel/fpu.o: warning: objtool: unexpected relocation symb=
ol type in .rela.discard.func_stack_frame_non_standard: 0
> arch/loongarch/kernel/fpu.o: warning: objtool: unexpected relocation symb=
ol type in .rela.discard.func_stack_frame_non_standard: 0
>
>   AS [M]  arch/loongarch/kvm/switch.o
> arch/loongarch/kvm/switch.o: warning: objtool: unexpected relocation symb=
ol type in .rela.discard.func_stack_frame_non_standard: 0
> arch/loongarch/kvm/switch.o: warning: objtool: unexpected relocation symb=
ol type in .rela.discard.func_stack_frame_non_standard: 0
>
>   MODPOST Module.symvers
> ERROR: modpost: "kvm_restore_lsx" [arch/loongarch/kvm/kvm.ko] undefined!
> ERROR: modpost: "kvm_restore_lasx" [arch/loongarch/kvm/kvm.ko] undefined!
>
> Cc: stable@vger.kernel.org # 6.9+
> Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408120955.qls5oNQY-lkp@i=
ntel.com/
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/fpu.S | 4 ++++
>  arch/loongarch/kvm/switch.S | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
> index 69a85f2479fb..6ab640101457 100644
> --- a/arch/loongarch/kernel/fpu.S
> +++ b/arch/loongarch/kernel/fpu.S
> @@ -530,6 +530,10 @@ SYM_FUNC_END(_restore_lasx_context)
>
>  #ifdef CONFIG_CPU_HAS_LBT
>  STACK_FRAME_NON_STANDARD _restore_fp
> +#ifdef CONFIG_CPU_HAS_LSX
>  STACK_FRAME_NON_STANDARD _restore_lsx
> +#endif
> +#ifdef CONFIG_CPU_HAS_LASX
>  STACK_FRAME_NON_STANDARD _restore_lasx
>  #endif
> +#endif
> diff --git a/arch/loongarch/kvm/switch.S b/arch/loongarch/kvm/switch.S
> index 80e988985a6a..0c292f818492 100644
> --- a/arch/loongarch/kvm/switch.S
> +++ b/arch/loongarch/kvm/switch.S
> @@ -277,6 +277,10 @@ SYM_DATA(kvm_enter_guest_size, .quad kvm_enter_guest=
_end - kvm_enter_guest)
>
>  #ifdef CONFIG_CPU_HAS_LBT
>  STACK_FRAME_NON_STANDARD kvm_restore_fpu
> +#ifdef CONFIG_CPU_HAS_LSX
>  STACK_FRAME_NON_STANDARD kvm_restore_lsx
> +#endif
> +#ifdef CONFIG_CPU_HAS_LASX
>  STACK_FRAME_NON_STANDARD kvm_restore_lasx
>  #endif
> +#endif
> --
> 2.42.0
>
