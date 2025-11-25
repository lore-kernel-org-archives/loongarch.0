Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89819230BD5
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 08:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058121; cv=none; b=T88f3yG+VWRZjetZxPjXdAU5SWwMAhFmkuY+eesfTHynB/OoP8Sldn0y5RUhEgPxQsyhuCKHpoYEdM4+TpTeu1RNRtMUfmypIQdcyBo1/VdGQsmrw4QtG1or/PEjVImOhA/DnhiY2VfOk1eqruUAoYuhN4xUL9PObU41rhTO9Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058121; c=relaxed/simple;
	bh=b8eJIAZq76zgEo3hwByfZwndhXwZzbEefH6FrzTGyFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvEx/7DUI2SHQPdESyn0MFpi6/Epm5PrXKKeKRQZ2An9rPTZ1NQdmmui4+ArZt2qFMQMpkXETVIoovaw+uiY5qQRtbRtMObsph942TwQVtInmgEEjSrVyt0n6YZlyROSs2kFobVGUXrNLh90ruVK/1CQTZRcafAxn9JoMc+vCXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4krrFBo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4krrFBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D8CC4CEF1
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 08:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764058121;
	bh=b8eJIAZq76zgEo3hwByfZwndhXwZzbEefH6FrzTGyFc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F4krrFBoIrjp2LuCLAWLr2ntpsOgzA8Dpph1qe66Vhx5TqF/VKOPDaR8ieX1uMS1m
	 AlxKnUreeB7vJdiTMGBClr31PqstK2pf31y8wN4i1/5Z5ipDfiz9E7P2Lh85St5XbD
	 g/jPMyJWZxwz2NNySzFUfgrnrEc/ecAyFWQiziTcAbCmR6Q6/P82Md2xoAYY/jJIrn
	 lWc8P61tGa3JJHeQqpeRFseQQIU7x5Q7oHRz08KVIM7tiXgkLB/aZ4WwWdY3Tr6kIC
	 QnkGDD1KbW7jromwD2ki6esv81b3vsqtivjZ2zwUWrrReIAD4SDwtMprLxvQSiFhOC
	 eRHuuhr8u1YQQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b737502f77bso742663166b.2
        for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 00:08:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcFVYSyOcdvGuXyVVZxjvRzAzfDXVH/AVsB0KsVPUITYlJlMGiY/JVIGCfWHZU10sGbzoOnpQkUU4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8PnMI+zkImyWepONreTneh4Cjh5Tx3/VIhu9mFTYQn45aPMbA
	voyAtE28H30ozl40A4xBA+zL7fDGcr/JCxrCQDLUFKNZfbIXZImohFgmhH65fN7IIvIfd4cXJ0q
	e17Jb2zyuORW1Y/3UgQ51hzib075sXfQ=
X-Google-Smtp-Source: AGHT+IEW5chkcqagJ5kUqTB75j03kZC2A96etsNa0C+GTdGif6kKR70ExIsWM4AU8gA+hvI/Ibd6yXSlxnTKi63dwoo=
X-Received: by 2002:a17:907:3c96:b0:b73:9368:ad5e with SMTP id
 a640c23a62f3a-b76c5515082mr177911366b.34.1764058119789; Tue, 25 Nov 2025
 00:08:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
In-Reply-To: <20251125063327.31586-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Nov 2025 16:08:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5AO38DAqxUyawwKW_f=ZuCaROj+s--vE8ham0sTWMxog@mail.gmail.com>
X-Gm-Features: AWmQ_bkIUsHsvzIfCUgMEEmvjEfBShx5l4n3XwDOu7cx7KdeAZIdyjfQZgzuRi0
Message-ID: <CAAhV-H5AO38DAqxUyawwKW_f=ZuCaROj+s--vE8ham0sTWMxog@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Xi Zhang <zhangxi@kylinos.cn>, Xianglai Li <lixianglai@loongson.cn>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Tue, Nov 25, 2025 at 2:34=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> When running virtual machine before testing the kernel live patching with
> "modprobe livepatch-sample", there is a timeout over 15 seconds, the dmes=
g
> command shows "unreliable stack" for user tasks in debug mode.
>
> The "unreliable stack" is because it can not unwind from kvm_handle_exit(=
)
> to its previous frame kvm_exc_entry() due to the PC is not a valid kernel
> address, the root cause is that the code of kvm_exc_entry() was copied to
> the DMW area in kvm_loongarch_env_init(), so it should check the PC range
> and then finish unwinding for this special case.
>
> How to test:
>
> (1) Update kernel with LIVEPATCH
>
>   git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
>   cd linux && make mrproper defconfig
>   scripts/config -e FTRACE -e FUNCTION_TRACER \
>   -e LIVEPATCH -e SAMPLES -m SAMPLE_LIVEPATCH
>   make olddefconfig all -j"$(nproc)"
>   sudo make modules_install
>   sudo make install
>   sudo reboot
>
> (2) Set up a VM with "-accel kvm", no need to specify kernel and initrd
>
>   sudo yum -y install edk2-loongarch64 qemu
>   qemu-system-loongarch64 -serial stdio \
>   -machine virt -cpu la464 -smp 8 -m 4G \
>   -bios /usr/share/edk2/loongarch64/QEMU_EFI.fd \
>   -nodefaults -no-reboot -nographic -accel kvm
>
> (3) Test the kernel live patching
>
>   cat /proc/cmdline
>   sudo modprobe livepatch-sample
>   cat /proc/cmdline
>   sudo sh -c "echo 0 > /sys/kernel/livepatch/livepatch_sample/enabled"
>   sudo rmmod livepatch_sample
>   cat /proc/cmdline
>   dmesg -T
>
> Cc: stable@vger.kernel.org # v6.9+
> Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
> Reported-by: Xi Zhang <zhangxi@kylinos.cn>
> Reported-by: Xianglai Li <lixianglai@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/unwind_orc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/u=
nwind_orc.c
> index 0d5fa64a2225..1d60a593479a 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -506,6 +506,9 @@ bool unwind_next_frame(struct unwind_state *state)
>                 goto err;
>         }
>
> +       if (pc >=3D (unsigned long)_end && pc < (unsigned long)XKVRANGE)
> +               goto end;
The __kernel_text_address() judgement after bt_address() do the same
thing exactly, so why do we need this?

Huacai

> +
>         state->pc =3D bt_address(pc);
>         if (!state->pc) {
>                 pr_err("cannot find unwind pc at %p\n", (void *)pc);
> --
> 2.42.0
>
>
