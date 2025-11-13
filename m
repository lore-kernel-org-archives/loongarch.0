Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984A32D0C9D
	for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763031406; cv=none; b=MjXgJe7NSX+mhbGtxi6V3+CTM5eeBk5U9LEzYUTIAZ4jKLszwNkeDmlZ/XPuX9a4jzKriDrCYkz1k2qc5ppcxRdrn9UF30zGCWiZhBifZrU1R62CZjmcprZPewXDWdnUydDUsvn5WRPXNNggK9I+8Xxk8yaJZIuQo/xECMM1YxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763031406; c=relaxed/simple;
	bh=krenDmY5Pa/azYQKBLv7banVwWeJRQZpar7uT320t2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmpM4cCAGJH0Rbwd8FnXaSmo3wpcQ9D2z8ouHUC3j5xmNUhJEA5JxHEgchk5thF5iiBvFDgd2h3cIA5kDb6FZ1pCk1yF75f83cZ1xcd+AW8eGtUGApQ7rucj8BUVVzfvClb1JUz1K923gfpztMneAzdf6cc6CD2VckWeYTFC6O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzMMcbPN; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzMMcbPN"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c28ff7a42eso231090a34.3
        for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 02:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763031404; x=1763636204; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaId7/74gQivPIasGTR9XCBW+VTRGYF6n2hctAny4u8=;
        b=OzMMcbPNqJQRay/x4+N+RVALtTkAtnnKJErcQoWiMWqQGFiMgrFXWu7Ws6QOPbMKtC
         oTntzh+8/0T3mYu+7DsYBJ5O8Har4mGn1wpFXCdIaQvvBgIKVJ5Za4MZvU+1qfGn+Jrx
         HwkQsY04rWjs7K4TAclsN6uhBdQ11+4j62nrz99deP5iWoGXJ891w/NGftmCoBx+nP+5
         lnw1kn7riLQLa9Dz6VrXNmciWh8FUsCjLFHeGtHrwbqeEVBmNomZqdLwh0F+wJS2TrEE
         U6/t1F+uFj5odJpitcTuacQhPy15imoNsIsVTLTnG0reVKa1zT+N8Mq0We/2Ci8PhgA1
         /obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031404; x=1763636204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RaId7/74gQivPIasGTR9XCBW+VTRGYF6n2hctAny4u8=;
        b=eeHRj1U2mSelr9jPzfpdQz/oAs7NuyM6w01H4TnL8KI1jQ3hBa91NcVFiE4eRlaUaP
         UrQhwDI/XqA9dqStv75RG80kBhj2xE8+InQAn01Fd78jYZSewqLX/HIHeQInTSaEPzCY
         BZ4hCwS4G51RJyCfHfE2FOMyDRGFtAaquew3ktKGaNmfCFeVG+YgqSAbH4VDoq1e93bH
         wB3CtW6MwsS9Cd0JNALbVRls30wLY2lBjJP/Y6KHj/8lzFv+SGNflJga8J1VME5GT+E5
         RBCAwpNVe+bcP3EQaecFW5v9S+8DzxhsHW6xQmNluV6hjb2YjgSMs7r2a8X2OXkPfckT
         q6VA==
X-Forwarded-Encrypted: i=1; AJvYcCXGbW7jzry4Y7ecDGe1qDoWR9HDrpevsyP6VBCJOWJ+rFD0RoumkvwXR45iM5VNXTDAhFi8OF66eLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNhLAcDpJo5DG6PEIMg79aZ8RjoEUnjb/mF9HxI4XgTx/sh8It
	lKlzpoPl096sRCMBMLl/RAX1xPiZ7JTEap6O7VSLPUG4uO/0fGxRVg7IOyjnDYaFZxK9/iFPYSQ
	Qz6hPmj+b5qJat99+8GRE6zqFWtVrIJ9tOn2F/BM=
X-Gm-Gg: ASbGncuCmBGaCvWQw3QNfFn6Oq6ExJY2n/drlR7feHSS3YvjkDBfsQqvYTXUpqaRJwW
	OcE7Eh1m6RhlBeZP9b+J4xI09wu17sZXoHLlNCK+QTmXYVEDpPhyBZwqNEzfWpywdTjFmf4XrcN
	An/5N/6ymWHHLjFiQfd+2zmYptFEkQ3EFRwjz1J7VhkmJDkyMDtuCoPtm1ALbD8Ig5K1znAWdxN
	0yD/DgY3aRYSZrhA51TkqoqTN6yRMtSBlgvGs5gOahOFE3lKMhY0tCdPyE=
X-Google-Smtp-Source: AGHT+IGQGWhNH8gO5EqjoOQURkh/FR8tu20xPEMu7Vequbuu3IOon3DhSgp7HPHuzp8wDH6Pl0k2rVkRjY2Wpp8QiH8=
X-Received: by 2002:a05:6808:6903:b0:44f:6d8b:5836 with SMTP id
 5614622812f47-4507444c435mr2750263b6e.1.1763031403647; Thu, 13 Nov 2025
 02:56:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251110175330.73200-1-vincent.mc.li@gmail.com>
In-Reply-To: <20251110175330.73200-1-vincent.mc.li@gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 13 Nov 2025 18:56:32 +0800
X-Gm-Features: AWmQ_blYnbtU1jLnbZ_yM4Z1iRh6dHavP1LxGvNFqPRWpVWU8LKAcj1ZvxL5OXQ
Message-ID: <CAEyhmHQ+0TQUukapz6opSCQzN8QwD_hMsXOGAYsaDZcdq-8KkA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Disable bpf trampoline kernel module
 function trace
To: Vincent Li <vincent.mc.li@gmail.com>
Cc: Chenghao Duan <duanchenghao@kylinos.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 1:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> The current LoongArch BPF trampoline implementation is incompatible
> with tracing functions in kernel modules. This causes several severe
> and user-visible problems:
>
> * Kernel lockups when a BPF program is attached to a module function [0].
> * The `bpf_selftests/module_attach` test fails consistently.
> * Critical kernel modules like WireGuard experience traffic disruption
>   when their functions are traced with fentry [1].
>
> Given the severity and the potential for other unknown side-effects,
> it is safest to disable the feature entirely for now. This patch
> prevents the BPF subsystem from allowing trampoline attachments to
> module functions on LoongArch.
>
> This is a temporary mitigation until the core issues in the trampoline
> code for module handling can be identified and fixed.
>
> [root@fedora bpf]# ./test_progs -a module_attach -v
> bpf_testmod.ko is already unloaded.
> Loading bpf_testmod.ko...
> Successfully loaded bpf_testmod.ko.
> test_module_attach:PASS:skel_open 0 nsec
> test_module_attach:PASS:set_attach_target 0 nsec
> test_module_attach:PASS:set_attach_target_explicit 0 nsec
> test_module_attach:PASS:skel_load 0 nsec
> libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
> test_module_attach:FAIL:skel_attach skeleton attach failed: -524
> Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> Successfully unloaded bpf_testmod.ko.
>
> [0]: https://lore.kernel.org/loongarch/CAK3+h2wDmpC-hP4u4pJY8T-yfKyk4yRzp=
u2LMO+C13FMT58oqQ@mail.gmail.com/
> [1]: https://lore.kernel.org/loongarch/CAK3+h2wYcpc+OwdLDUBvg2rF9rvvyc5am=
fHT-KcFaK93uoELPg@mail.gmail.com/
>
> Signed-off-by: Vincent Li <vincent.mc.li@gmail.com>
> ---
>  arch/loongarch/net/bpf_jit.c | 3 +++
>  1 file changed, 3 insertions(+)
>

You should add a Fixes tag.

> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index cbe53d0b7fb0..ace89ca95f9b 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1624,6 +1624,9 @@ static int __arch_prepare_bpf_trampoline(struct jit=
_ctx *ctx, struct bpf_tramp_i
>         /* Direct jump skips 5 NOP instructions */
>         else if (is_bpf_text_address((unsigned long)orig_call))
>                 orig_call +=3D LOONGARCH_BPF_FENTRY_NBYTES;
> +       /* BPF selftests module_attach failed, disable module trace */

We disable it not just because BPF selftests failed, actually it
causes severe issues.
So this comment should be reworded.

I am also wondering why we didn't skip nops for kernel module
functions in the first place.

> +       else if (is_module_text_address((unsigned long)orig_call))
> +               return -ENOTSUPP;
>

I am OK with this approach since we can't fix it in time.
Except the comments above:

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

>         if (flags & BPF_TRAMP_F_CALL_ORIG) {
>                 move_addr(ctx, LOONGARCH_GPR_A0, (const u64)im);
> --
> 2.38.1
>
