Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E00286A9
	for <loongarch@lists.linux.dev>; Sun, 12 Oct 2025 03:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760239944; cv=none; b=I7L4OagmjGWwpXPfJw8xhkDBj2JvKZgKj+90I5SU/flWtUhtTs9w66/yT5ENVfn2pVlbvxDfFySBYdidFhJezYgBG4k70jKX1W0PeBRMFSj+SfQ2lXuS+TNaBHqpQeIHVFZC71nwL0d1W50l2Jvve4LICF+EK2leU8fhO5BBado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760239944; c=relaxed/simple;
	bh=ZfsJnJ0opmgKMuk/pPDhNj8eWAQNHaTwloQR05KNdIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WT7y7ZPsCXzm9KVxgE0sZAEVTXwr7Ysnelhp4F/q5R2nxo0VZIge1sFnMIujU3csvC9epubwoLN2CgXKfA42IMZ0DHQ9sGq6hdvMy9k2E8P69mmpWK+eekkLCVtubrOGJ6tq2nuOOnSrBTAk9QgVD+91f95lcO6xyzHAuNjixiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIzysIyo; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIzysIyo"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3544c64380eso4121264fac.3
        for <loongarch@lists.linux.dev>; Sat, 11 Oct 2025 20:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760239941; x=1760844741; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10Kc9v97RxhFDpiuG2bP7l73wF4ENJcy5CnuTcY1uas=;
        b=BIzysIyoJYHLP2TP6x9Hjy18deTDyxzlKqfoWmUF4XgKM5F+ALMenX8nXyxmiJ5Yci
         JpEJoiZpOndFqtyiHssp5yjZkUa92afNQ1d+hUCFkz6eJ20acba5i/9JVDUyQU/wwXpp
         AMDPQKqHUD4Jw5Zp+JZLIkkQRJ97XFZok4D/Br0yTSY8xBK/txIyOjbv/syrLBH63er8
         aGNMrROeVqOfDAaK7/r/YUkBQVhdxbtXBJJS/AkUrolvQMMFcPMr1FpZeeKFOKuW4+AT
         JVPkXFCESkttln4DUGQEiuccHZnqSBrQOVHwkuQ+K60QVSfe20GqNcIZTPI3FvSCTpht
         G8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760239941; x=1760844741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10Kc9v97RxhFDpiuG2bP7l73wF4ENJcy5CnuTcY1uas=;
        b=HUU+TodOOCWeMw1MANcxtnmi2bXx1DsVZF3J1SLKFa5u41rXhTo1LLkpre+eXy1UTv
         5bfjrorzauiwITKEMbJ5dktaoLjY7MB6ILkW2Nri/MjepPbc/wFmiQK5ZEXAPsmAsStc
         1DfkGhUH5FAtd+rf4rH0m+3t61cwt9Wds045zRXCfSNl78V96g1ugTWMuqLUDh7a1v5C
         zDWLtI41ReDNhpkAv05fg4fMt4H/vL7G8TuxIiKoe6vM1xxQn/UmoonBvpoVDBDHazdJ
         lK9VQDqOQA0Cq4oUjoIdU1V1lzIpv8uhH2WZ/1ogC77sJgwL0n3qjbpKqki2oQL3PeBC
         u21w==
X-Forwarded-Encrypted: i=1; AJvYcCV5o75QIv6AouW7YBaFcAMAZ69cjHDbqrL7cWMHCRajSJFYCKnnCriDUePvfKG4NYX94vG7lRz5QAM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVEZe8HdXu0enggLDRv6zP1ckHKofDOmUoiB68go3XB9sP1KSd
	LFq10G90e7ystGqFWy2ZpcM4iIpcM+dkCaYj0o5N9ZWIUfHpSDr4QutUV/YMFyNqdH3ovlt5Q+j
	8JtNRaTFOMPlGfLZmrPnbPMKTogDAeSg=
X-Gm-Gg: ASbGnctYdDvaioReWN7rvIwOywHPMOla2/N0LZPQu+3YwMfUWmv6C9cxTXgyv2qK6gw
	tnCXL4Z9/aJYT847tIAf65Et6XZVyfZ0kvFR05Q4rotmDEO5Qu8pv6Pwp9kn0aQyxgLRFQPThyJ
	+2SMe9ZR5x7JJk6ppt0rF4R55F/MZfJmu1kx9sufHQ6E9vYHUBQ7CsdKafqsoLIMlz7vPBD9QAX
	7rr9/9d/HhOKYDUIUyOpwV1T+bVQN1uxc4w
X-Google-Smtp-Source: AGHT+IF0C4Vj7jHyb9wO0wRwufrmI3QAjBbSFl4jfRwJ8exDBqMzcf5p1e63OVR+mGtVbTvnJ8O3Z9bSsiB85Ht1GT4=
X-Received: by 2002:a05:6870:26b:b0:367:17f3:c208 with SMTP id
 586e51a60fabf-3c0fac5586fmr8717748fac.37.1760239941413; Sat, 11 Oct 2025
 20:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251006053323.193581-1-hengqi.chen@gmail.com>
 <20251006053323.193581-2-hengqi.chen@gmail.com> <a06b3732-a341-907b-5b97-954ca31cc8a0@loongson.cn>
In-Reply-To: <a06b3732-a341-907b-5b97-954ca31cc8a0@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Sun, 12 Oct 2025 11:32:10 +0800
X-Gm-Features: AS18NWDwr9p8rxSHuV4qTIQaRUMxaipi6Jr_pHPGUC0xIJHIIzgHFp92APWTNOs
Message-ID: <CAEyhmHRzNgc67=MAu65KkwdrrKawsbeYmFbpsb22VP0y13LuCw@mail.gmail.com>
Subject: Re: [PATCH 1/7] LoongArch: BPF: Move sign_extend() upper
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: chenhuacai@kernel.org, vincent.mc.li@gmail.com, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 10:02=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/10/6 =E4=B8=8B=E5=8D=881:33, Hengqi Chen wrote:
> > Move sign_extend() upper in bpf_jit.c so that it can be used
> > in build_insn() without forward declaration. No functional
> > change intended.
> >
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >   arch/loongarch/net/bpf_jit.c | 62 ++++++++++++++++++-----------------=
-
> >   1 file changed, 31 insertions(+), 31 deletions(-)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index 5a2fc56b1fe0..4e6ef93ab0d3 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -437,6 +437,37 @@ static bool is_signed_bpf_cond(u8 cond)
> >              cond =3D=3D BPF_JSGE || cond =3D=3D BPF_JSLE;
> >   }
> >
> > +/*
> > + * Sign-extend the register if necessary
> > + */
> > +static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 size, =
bool sign)
> > +{
> > +     /* The ABI requires unsigned char/short to be zero-extended */
> > +     if (!sign && (size =3D=3D 1 || size =3D=3D 2)) {
> > +             if (rd !=3D rj)
> > +                     move_reg(ctx, rd, rj);
> > +             return;
> > +     }
> > +
> > +     switch (size) {
> > +     case 1:
> > +             emit_insn(ctx, extwb, rd, rj);
> > +             break;
> > +     case 2:
> > +             emit_insn(ctx, extwh, rd, rj);
> > +             break;
> > +     case 4:
> > +             emit_insn(ctx, addiw, rd, rj, 0);
> > +             break;
> > +     case 8:
> > +             if (rd !=3D rj)
> > +                     move_reg(ctx, rd, rj);
> > +             break;
> > +     default:
> > +             pr_warn("bpf_jit: invalid size %d for sign_extend\n", siz=
e);
> > +     }
> > +}
>
> Is it better to move this function to arch/loongarch/net/bpf_jit.h?
> Just put it next to emit_zext_32() and emit_sext_32() because they
> are similar helper functions.
>
> In my opinion, the function name is not proper because it contains not
> only sign-extension but also zero-extension, maybe we can rename it to
> emit_extension(), then the patch #2 can be dropped.
>

Will add a new helper in bpf_jit.h since the existing sign_extend() is
not generic.
Will also drop patch 2. Thanks.

> Thanks,
> Tiezhu
>
