Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3B03B9937
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613554; cv=none; b=epmNMy7wj0tqUzRwX3l33tZfoiBVwFbZNa77CwVfDsRTNvqAWuGY8A1czHRCD/C5A+5jJDi8IVcM6li7SAeHiCdPQ3tYBqAAyifMWdpmQAgHxdIeS/c6GGz994RwCuWgtMpN4gAKaiYGq33SKum7vepyuyGD1ZojR6+yP2ZXu+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613554; c=relaxed/simple;
	bh=kyhOfMLtunwO9Vr5eSz5/4Et7usL1vIVLa1aHC19CP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvMEwMOweUKA1IRCFzloRHseNdaMah+fmHF4isQoidpglP+C7XxWns805vVZKXRTIooHHJnYxeZ69lyiIBvlq77QlsEVVe5XB9xg1cpVd6wt9zi7MixM7H9TOP9tsMGXI0nwDD5I9PcbBMsuP5uOzNf7Iov70b+gxovDZWCIHxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBMiZesF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBMiZesF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292F91F000E9
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786613553;
	bh=YlGA+qDZ1tX1wTxHLaOT7aTB69OaI7jJCfXqLHOttq0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HBMiZesFVrxJxJDgLYzK+wBXF/SM/f/eNRF+/RFQNVqMBcZIoklVqvPjZsvTj0kSp
	 /f1zs7+cvsUQkbYNeYEDjzmDJlVg5GACwaj5CAocCHluAu9AnANu0xLObTnpcsz12d
	 K/1kzShpgzU1e/vtsF4coBd+eeTPmYJjc1c8T9WtINKcOWOHLWU6Q4Zmvx7i1yZBFI
	 r9LcMIEbSFYNmCmEQnAS+Ju8w/Ial1M7U6NmQUhdMgtZB+I1phHoGL74Hck/3K2wvA
	 FfIS588hGYL1hEpN/YXMY73hAXqVaBv1wbaS6fHoiORt8XtUOhONpb/kXvL8zrkZ5r
	 EOEfw/STfd6iA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso3016203a12.1
        for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 02:32:33 -0700 (PDT)
X-Gm-Message-State: AOJu0YyOdLuk3IqFfxbcKDuS0hyHdxxFHxDNq3e2HoONDG+ElVQo1Gge
	/9O8KLY5W+ApqFcOrQ3GNd1VXFIkKJAZDrdZTEaTkNyZ4fPxTba2tb/pRtFi2Eh+0hhuKhGaCz5
	lLXpc7hNGg41xhNzqk06nvFUKrUuFjLg=
X-Received: by 2002:a05:6402:3212:b0:6a3:7177:9897 with SMTP id
 4fb4d7f45d1cf-6a38073e5c3mr2359620a12.19.1786613551854; Thu, 13 Aug 2026
 02:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813090506.15574-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260813090506.15574-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 13 Aug 2026 17:32:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7wh+8E1HEG2tAwg=7MEa228oTHRKKKqMA6wDJc4vFmZw@mail.gmail.com>
X-Gm-Features: AUfX_mzz06xQqt1o7nTf-ZyjF2X6MhjfEerlrGunsC41P790ywR98mu2H6isiZ4
Message-ID: <CAAhV-H7wh+8E1HEG2tAwg=7MEa228oTHRKKKqMA6wDJc4vFmZw@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: Use current_stack_pointer in current_pt_regs()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Thu, Aug 13, 2026 at 5:05=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> The current implementation of current_pt_regs() relies on the compiler
> __builtin_frame_address(0). This introduces an unnecessary dependency
> on the frame pointer register, which forces the compiler to generate
> redundant prologue and epilogue code, create a larger stack frame, and
> perform redundant memory operations to preserve the frame pointer even
> in functions where it is otherwise unnecessary.
>
> Optimize this by switching to current_stack_pointer, which explicitly
> maps to the hardware stack pointer register. This allows the compiler
> to compute the stack alignment directly from the natively maintained
> $sp register, completely eliminating the overhead of preserving and
> restoring the frame pointer on the stack memory.
>
> As a prominent example, this optimization significantly improves the
> hot-path function copy_thread(). A localized disassembly comparison
> of copy_thread() illustrates the elimination of the frame pointer,
> the reduction of stack frame size from 48 bytes down to 32 bytes,
> and a more compact epilogue path:
3 instructions and 16 bytes stack space. There is improvement, but not
"significantly".

Huacai

>
> Before:
> 00000000000004f0 <copy_thread>:
>  4f0:   02ff4063        addi.d          $sp, $sp, -48
>  4f4:   29c08076        st.d            $fp, $sp, 32
>  4f8:   29c06077        st.d            $s0, $sp, 24
>  4fc:   29c0a061        st.d            $ra, $sp, 40
>  500:   02c0c076        addi.d          $fp, $sp, 48
>  ...
>  54c:   1400006e        lu12i.w         $t2, 3
>  ...
>  55c:   03bffdce        ori             $t2, $t2, 0xfff
>  560:   00153ace        or              $t2, $fp, $t2
>  564:   02fb05cd        addi.d          $t1, $t2, -319
>  ...
>  628:   28c0a061        ld.d            $ra, $sp, 40
>  62c:   28c08076        ld.d            $fp, $sp, 32
>  630:   28c06077        ld.d            $s0, $sp, 24
>  634:   00150004        move            $a0, $zero
>  638:   02c0c063        addi.d          $sp, $sp, 48
>  63c:   4c000020        ret
>
> After:
> 00000000000004f0 <copy_thread>:
>  4f0:   02ff8063        addi.d          $sp, $sp, -32
>  4f4:   29c04077        st.d            $s0, $sp, 16
>  4f8:   29c06061        st.d            $ra, $sp, 24
>  [ prologue st.d and addi.d for $fp are completely eliminated ]
>  ...
>  544:   1400006e        lu12i.w         $t2, 3
>  ...
>  554:   03bffdce        ori             $t2, $t2, 0xfff
>  558:   0015386e        or              $t2, $sp, $t2
>  55c:   02fb05cd        addi.d          $t1, $t2, -319
>  ...
>  620:   28c06061        ld.d            $ra, $sp, 24
>  624:   28c04077        ld.d            $s0, $sp, 16
>  628:   00150004        move            $a0, $zero
>  [ epilogue ld.d for $fp is eliminated; exit path is shortened ]
>  62c:   02c08063        addi.d          $sp, $sp, 32
>  630:   4c000020        ret
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/ptrace.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/ptrace.h b/arch/loongarch/include=
/asm/ptrace.h
> index e5d21e836d99..2a7ed442d905 100644
> --- a/arch/loongarch/include/asm/ptrace.h
> +++ b/arch/loongarch/include/asm/ptrace.h
> @@ -170,11 +170,7 @@ static inline void die_if_kernel(const char *str, st=
ruct pt_regs *regs)
>                 die(str, regs);
>  }
>
> -#define current_pt_regs()                                              \
> -({                                                                     \
> -       unsigned long sp =3D (unsigned long)__builtin_frame_address(0);  =
 \
> -       (struct pt_regs *)((sp | (THREAD_SIZE - 1)) + 1) - 1;           \
> -})
> +#define current_pt_regs() ((struct pt_regs *)((current_stack_pointer | (=
THREAD_SIZE - 1)) + 1) - 1)
>
>  /* Helpers for working with the user stack pointer */
>
> --
> 2.42.0
>
