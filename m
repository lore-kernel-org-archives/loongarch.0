Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9476D29DB61
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764061502; cv=none; b=g2nAY6dIq7DGkPWv5Qpa5Zj26oTX/Qyd8NXwPZd4OGJB/QwQYkR6y4XECtgbNWcQR/HGzWPOIwbCu/n9BOBuUZNwc4iVGd2etYZ/AQyVXconrMJUlYoDi5sZDwLgMGQ5+Clv+qTigfOOwVjb1gEpSM/GGDIYW/KQxycAvEtd1KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764061502; c=relaxed/simple;
	bh=LDihYCh1QvlFLK+0AtAjvzyT9+1rK1lmbm0z55jasuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2xRIrsH0BA9aXNO/UHe7Z7K8SRWXMY8MK0Yx4w04dbMwnkyTyWerOunUmHivCyD0JrBTqpZ52bFdQoNxK4TPpjx9fTYiY5aGQpk3d4nfqqzSp8fDXoxJ+uSluWuhkkMxQ+axN1rRzV1RBOh+y1+9ohiwnlK6EWliLzNaufgwes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z44Wlbfd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z44Wlbfd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CA7C4AF09
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764061502;
	bh=LDihYCh1QvlFLK+0AtAjvzyT9+1rK1lmbm0z55jasuQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z44WlbfdStXuntpWJ/iAKt8N2C5LHZ7sI8LlVJh8Iezjn396sYplCL6oNngxwHSvk
	 iBnS7TZd2bobmZ6N2ZzuyRQZN8WZIZt2ZSJITIh310EynSqI961EqHV/NypnMzvsnx
	 tmBxRwTvgeYFhEwEmWoP0F7FWsM0/JRQbkCg3PLxwSaHWGJjnojo3BDTIdy0tGaa1W
	 h+MzWuUa8E4tyfjktYXtHLYZlzrnvzAUH3YN5KTc0zlPUg4uSap14lYrNiQGx+whii
	 Uf/NrgdZSLEITKYJtqQaOmdrqQqa25ue0LOCL6kHS7sKR+RCM8niCcK+rHRuE4ks8s
	 5mwOKYqKIf7Bg==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso9299310a12.2
        for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 01:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOZjU3cw4Jl6S7QlLoiQRtuIpZRlQaVTOpYR8HbnmbsdyT0yWhBBYu55hhHIGkOHjWpUDAnW5HZ6o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAPjPJN8ZJGbTEWcb5PfQp3DwrsTV8BIVpQIr1mopoBwaexL8P
	tY1GKRjPG/rVjCrpsSxyBZKO6KC2fA9HH+MCzA/I1Lnz9zf3CdWUW5VjEmyFh+ndzh8ULhD9+qo
	KletyjvlBzCARC/bUAbAdmxhhmEefa5M=
X-Google-Smtp-Source: AGHT+IF3rJkCwWWAEXMsZE24AhfjJ5QqvL4kIJW5j11vU/nFDorLH4lBQ9gypaHZonF4mZeuXoiao7+YhuwriX6+ass=
X-Received: by 2002:a17:907:f495:b0:b76:372f:78ac with SMTP id
 a640c23a62f3a-b7671a470b4mr1598937466b.28.1764061500929; Tue, 25 Nov 2025
 01:05:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
 <CAAhV-H5AO38DAqxUyawwKW_f=ZuCaROj+s--vE8ham0sTWMxog@mail.gmail.com> <332975a8-c7f1-76d5-0628-cd7260ad1180@loongson.cn>
In-Reply-To: <332975a8-c7f1-76d5-0628-cd7260ad1180@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Nov 2025 17:05:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H77duX-WiYsJzkJChmGHdGh5y_k6YEvLQdpDys5iLctgw@mail.gmail.com>
X-Gm-Features: AWmQ_bmzhlWOTkqs0A5Z97dDxKRI_QQfeDEEpxclv5lUYczpmBkOAuMEUphXygg
Message-ID: <CAAhV-H77duX-WiYsJzkJChmGHdGh5y_k6YEvLQdpDys5iLctgw@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Xi Zhang <zhangxi@kylinos.cn>, Xianglai Li <lixianglai@loongson.cn>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 4:54=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/11/25 =E4=B8=8B=E5=8D=884:08, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > On Tue, Nov 25, 2025 at 2:34=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> When running virtual machine before testing the kernel live patching w=
ith
> >> "modprobe livepatch-sample", there is a timeout over 15 seconds, the d=
mesg
> >> command shows "unreliable stack" for user tasks in debug mode.
> >>
> >> The "unreliable stack" is because it can not unwind from kvm_handle_ex=
it()
> >> to its previous frame kvm_exc_entry() due to the PC is not a valid ker=
nel
> >> address, the root cause is that the code of kvm_exc_entry() was copied=
 to
> >> the DMW area in kvm_loongarch_env_init(), so it should check the PC ra=
nge
> >> and then finish unwinding for this special case.
> >>
> >> How to test:
> >>
> >> (1) Update kernel with LIVEPATCH
> >>
> >>    git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git
> >>    cd linux && make mrproper defconfig
> >>    scripts/config -e FTRACE -e FUNCTION_TRACER \
> >>    -e LIVEPATCH -e SAMPLES -m SAMPLE_LIVEPATCH
> >>    make olddefconfig all -j"$(nproc)"
> >>    sudo make modules_install
> >>    sudo make install
> >>    sudo reboot
> >>
> >> (2) Set up a VM with "-accel kvm", no need to specify kernel and initr=
d
> >>
> >>    sudo yum -y install edk2-loongarch64 qemu
> >>    qemu-system-loongarch64 -serial stdio \
> >>    -machine virt -cpu la464 -smp 8 -m 4G \
> >>    -bios /usr/share/edk2/loongarch64/QEMU_EFI.fd \
> >>    -nodefaults -no-reboot -nographic -accel kvm
> >>
> >> (3) Test the kernel live patching
> >>
> >>    cat /proc/cmdline
> >>    sudo modprobe livepatch-sample
> >>    cat /proc/cmdline
> >>    sudo sh -c "echo 0 > /sys/kernel/livepatch/livepatch_sample/enabled=
"
> >>    sudo rmmod livepatch_sample
> >>    cat /proc/cmdline
> >>    dmesg -T
> >>
> >> Cc: stable@vger.kernel.org # v6.9+
> >> Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
> >> Reported-by: Xi Zhang <zhangxi@kylinos.cn>
> >> Reported-by: Xianglai Li <lixianglai@loongson.cn>
> >> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >> ---
> >>   arch/loongarch/kernel/unwind_orc.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kerne=
l/unwind_orc.c
> >> index 0d5fa64a2225..1d60a593479a 100644
> >> --- a/arch/loongarch/kernel/unwind_orc.c
> >> +++ b/arch/loongarch/kernel/unwind_orc.c
> >> @@ -506,6 +506,9 @@ bool unwind_next_frame(struct unwind_state *state)
> >>                  goto err;
> >>          }
> >>
> >> +       if (pc >=3D (unsigned long)_end && pc < (unsigned long)XKVRANG=
E)
> >> +               goto end;
> > The __kernel_text_address() judgement after bt_address() do the same
> > thing exactly, so why do we need this?
>
> They are different code paths, the current path is "goto err", it will
> set state->error as true, then arch_stack_walk_reliable() will return
> -EINVAL.
>
> With this patch, the code path is "goto end" for this case, it will
> not set state->error as true, then arch_stack_walk_reliable() will
> return 0.
Then can we replace "goto err" with "goto end" at  __kernel_text_address()?

Huacai

>
> Thanks,
> Tiezhu
>
