Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A24F31D72E
	for <loongarch@lists.linux.dev>; Sat,  3 Oct 2026 04:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791000126; cv=none; b=HZxzEcI0HOqXup4nDZ+qlVXgTVjQbEy22JH1H47BmcMUkXL+5nTv15FSxDjrEYHaMWVYqoCGjaF+nltzzHlKhHwh5OBHrtWbWJpVJaK2GRlM9Tj82Njq21o8e+JOC5Ol9urmlX268eeHsfGZBtn123+BIEjC/oPltwOFpZPFzUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791000126; c=relaxed/simple;
	bh=N9KRosXR8ymgtmmBzokfwvipVO0/UlM152jsumDQJHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3+bmrMy7ywjNZ/7jKOJ8Ckve93xlyAC4ifGC79R9gGQBcqQFGo33LCrr1L0dlAwAELwKkpp/b67jeREtW6Uqs3TRz7ZWvrGhvqM+nUXXc1xDo2EXPR97GHF0v1bj9pbAbkaeyPm52/s+vZSxslsSxedvmKCFtUwh4TKhEFtfDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFFK52r+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFFK52r+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107FD1F00898
	for <loongarch@lists.linux.dev>; Sat,  3 Oct 2026 04:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791000125;
	bh=GwjWGLhha1nNzvOsdUz4LVg1JPaiqv599pxKsS12uEM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MFFK52r+76abohkSgW0z98Dh+QBj3odOw2qElqPXCqPsysbC4gvPEkxOCadquj+Di
	 4BHMDQQtfzdTvIZ5/+jS1r6bC3Hq6ti4jaG7lzapNKURojI/faLS2WHxmV27OOUP1b
	 t61X/CMunp/+osxRMgAJwqtxWPuyf3qEEdo4jhLerboBDdxKCPFKZV3vYEFutLJLSq
	 HAHh4s63WaUIy42EqdmTWbHXXXJpaYNM2xmfX9RVpRcchrOkRKhfqk2qcyhA8ETy/N
	 9N91MdvLOObQfYo8ERL6CnHTrZTmg3q3u6fWm78rE2rv+hdc04Kfzjhl5qxLmY6duI
	 xMifC452mOiyA==
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso218830a12.0
        for <loongarch@lists.linux.dev>; Fri, 02 Oct 2026 21:02:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByw2b5d0rhOP/Nk+vcqvtM6HKZaZEXzKz6L1fn2/LjO2Nk1Gy2ay8waDkDppl2hJ5eu8f2Uc/Lg0g4=@lists.linux.dev
X-Gm-Message-State: AFq9FYLrLmjGwxwYIqn15/W1E6m7pq6n6QSypME4Ksfk5yfCPyMVIeb2
	0IynYukpuVLzBWDu4i6BWa+alIWcHBSRwVUcUZ/3RH+8wXNwxTrMLJtEwCxoHYki04bfPw1aLFM
	UYKNWUJbHO5xj7m3fi8Z+Xt9Xl1IptXw=
X-Received: by 2002:a05:6402:5112:b0:6ac:a5a0:a1c6 with SMTP id
 4fb4d7f45d1cf-6af9e2f9d4cmr3323624a12.8.1791000123721; Fri, 02 Oct 2026
 21:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908073906.31781-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260908073906.31781-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 3 Oct 2026 12:01:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7aEiDuNutHpyjW8qm9t9UQgiwTy8DOeWtaV4moRWVs2w@mail.gmail.com>
X-Gm-Features: AclHuK9jI5fPSJhQQayJegCXi0IsuTZcKF-XsaAeva7ZW9gZKGDVrgeT04xg-2w
Message-ID: <CAAhV-H7aEiDuNutHpyjW8qm9t9UQgiwTy8DOeWtaV4moRWVs2w@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Remove arch-specific __smp_mb__{before,after}_atomic()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.


Huacai

On Tue, Sep 8, 2026 at 3:39=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn>=
 wrote:
>
> When running the BPF selftest "test_progs -t timer_lockup" on a LoongArch
> machine, the kernel intermittently experiences soft lockups and panics in
> hrtimer_cancel().
>
> The root cause is that bpf_timer_cancel() relies on smp_mb__after_atomic(=
)
> to provide a full data barrier after a relaxed atomic_inc() to ensure the
> proper store-load ordering before performing lockless dependency checks o=
n
> weakly-ordered architectures such as LoongArch, but the current definitio=
n
> of smp_mb__after_atomic() is a plain compiler barrier.
>
> This allows a subsequent read to bypass the prior write due to store-load
> reordering, enabling concurrent CPUs to simultaneously bypass the softwar=
e
> deadlock detection, enter hrtimer_cancel(), and then trigger a severe ABB=
A
> deadlock in the hrtimer core.
>
> Moreover, there are hundreds of smp_mb__after_atomic() call sites across
> the core kernel (kernel/, drivers/, mm/, net/, fs/) that currently lack
> necessary full data barriers on LoongArch, which have potential risks.
>
> To comply with the LKMM specification, fix this by removing the incorrect
> arch-specific definition of __smp_mb__after_atomic(), so that this macro
> can automatically fall back to the generic definition in asm-generic that
> maps to __smp_mb() and emits the required hardware DBAR instruction. Whil=
e
> at it, do the same thing for __smp_mb__before_atomic().
>
> With this patch, the BPF timer_lockup selftest was stressed for 1 million
> consecutive loops on a physical LoongArch machine without encountering an=
y
> further lockups.
>
> Reported-by: Vincent Li <vincent.mc.li@gmail.com>
> Closes: https://lore.kernel.org/loongarch/CAK3+h2xOSEZUHhou7N2cRL-aGrZCNS=
m45g+P7thObMe+fpgYCA@mail.gmail.com/
> Fixes: 46859ac8af52 ("LoongArch: Add multi-processor (SMP) support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/barrier.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/barrier.h b/arch/loongarch/includ=
e/asm/barrier.h
> index 4b663f197706..84c6d739119d 100644
> --- a/arch/loongarch/include/asm/barrier.h
> +++ b/arch/loongarch/include/asm/barrier.h
> @@ -57,9 +57,6 @@
>  #define __WEAK_LLSC_MB         "                       \n"
>  #endif
>
> -#define __smp_mb__before_atomic()      barrier()
> -#define __smp_mb__after_atomic()       barrier()
> -
>  /**
>   * array_index_mask_nospec() - generate a ~0 mask when index < size, 0 o=
therwise
>   * @index: array element index
> --
> 2.42.0
>
