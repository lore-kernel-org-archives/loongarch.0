Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B85635F170
	for <loongarch@lists.linux.dev>; Sun, 26 Jul 2026 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785055874; cv=pass; b=g5jRc5kEOb3TSwowztRuggWs4rE85kNK77/PIgs3UMkB2HWYUB+HBFDvgDAwp5WrQ2u8u+J+SgTtH17B+iM/I/Hu0052Eqwl3g0Gl6fzwzIKMkIh5aIjeaQzWSyq2JJpgX2kyXt70ojBdA20gJ4ARya7O/AndWBt7hZqPvqlxYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785055874; c=relaxed/simple;
	bh=rqz7d2m3VZstPz+96gzxXTWggZ9WTTq04ig0rUihvKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7C2Fs1zD7B5Ywe7MY/eoWKECgXffn8NqIFitx/af/7jss186OuNYCTci/QKdv+Eu7OBMbzuwJySGK/kx3Jm4IORi/WU6SiSojq90cPenwP/1refNjnZv1yRSeFkh6OSQvc6MzHVG1tgRV7vdb/B4QRtIdK8Eu5q0iNVdaKQJzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjZyg8CJ; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjZyg8CJ"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6a168dc590cso1057994eaf.0
        for <loongarch@lists.linux.dev>; Sun, 26 Jul 2026 01:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785055872; cv=none;
        d=google.com; s=arc-20260327;
        b=rM3mffzceWCYBDOzJSPMyHGXlomQrHQHEsfvPMnOIinZ5N/BG6U2DJD4hwXuprMcol
         zl/NeG1T3b5OwkP+F0kPrJp14xONJoiMCPIYxKXZv0sNNwPaq7mscdAhvimOxAkoltTf
         fHjR0IOBiAmIeo9hMPMusX2wtue5+FuU3sGaYNjyxLSmOZ+vRPvCNXzuGPsG81+Oypsx
         ZyeRSDHOA7LOu73wsjgnxCApBgq6aM/Dv+bfxSH+LaD57GR+U+BMJOso+tCrV+XKE6ly
         iukl2GCwD69Mq9cI118aRo1eEkA+YAXME+NtVsNEo/zg7bkU45Nnbmf80pw2sY4UhDxQ
         EsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BPuSW2wZArI0F9+o5ZkCVesoYUmAaH0wK5ElTdhyANU=;
        fh=TT7RVH+WWWzO/vp4rKuc0jwSjiHi6UcpfL4482lVfHA=;
        b=mQjIZmuWUgwbpklaCIndrwi9C4TmSSkJOmsVoloYtq6IIshyGsR6+J08BK3YHNWsn3
         5hgwSb/NMdAV8d7zXxZnLAtuB3NVZFZ4jHGG5RPb1eBibZf+l/K/sRuLSNFBnYVmiIkr
         IiVuFJ26lOTNi9LdVXph+iELtNL5/YXM489vQ1u/SE3q0zG/Qk/Z5abuxJGf67H24gQY
         tNkYnrAcQDYsrl53klJajr8lpp9kavs13+fCa7x3HiIDhv9IdQwUf8Ab22ZVeRezGOpL
         OERAXyZWpBs5EuY4dqXa7TInIVTaVIqb4jBK50oolzFc+a6rjkmWtFSlFNlz5v96vJVs
         zNlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785055872; x=1785660672; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BPuSW2wZArI0F9+o5ZkCVesoYUmAaH0wK5ElTdhyANU=;
        b=YjZyg8CJUhL5bxzKSSxtuP6vf6+zwpLskil/T2g3yyIuhJl1mUp+CvT6VZHAs29wTH
         LipFaIRgZ8E0XUOMm6KYgo7LkdQL5aCHm49fL3w43nrQMcjGl+tIQUt2ut4oJhSpXXpa
         ooc1ydSeApzwQCvBI+ploDJ4DvoGIuxTk3DkBAtNHSKWN3kEL6oryfcPfE8KKXLbVSu8
         aMFvKX925NMfQhzyC0nfN/+LuzU9Eph+a7BdRflOL+JlVA79mDCHn7VedSu4kImbSbkY
         wJUbiW2QvDGt2Np47LbPO30Tq/taIBIzFSjwA8/Qlmt0pyrBVbTAc+WjMuz9caRtb7uY
         xVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785055872; x=1785660672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPuSW2wZArI0F9+o5ZkCVesoYUmAaH0wK5ElTdhyANU=;
        b=cUEE3whMAOm6+Sk4X2RcdNMDNL3Nz5B7Gl9cN+m9nzeZqEg2CLUPS/1NvX9BvZLmOR
         +K1nao10rvK0A4113BDfd32qpL2+D1OLlvSU0meZ5KBc3VEp0r+lG7Dun0sl2nUhhJiD
         hoGFq/253oD9i+BtH3QfOzEYkCoFhYuakopNcJfDNPROK8tjCZOiNX+yXSBgA7MrwyoW
         al559fvIWs1Mpk3iPXWHPuklAAgomcAsRicvT5883ZXziQKdH04w6SC3ONHchXCYOhPC
         FMdwQ0jGlvMxWqNfBKZeSmR9mMybj7sPvB+Aj5nWNAbFg751ICBSWO5sRgMmu+oPTXUy
         DdQA==
X-Forwarded-Encrypted: i=1; AHgh+Rqyt6e9vFjdoLBRw62VBmkOYyfo+oNOuAC2HDyMkK2YTvdFB433mU6TamQsTTrHoDojtNrzKA/p5mI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJFXRTa3z77Q/Ah4v3Q8RYTUqk3hChI0ocVe1IDVrAjVHYbgye
	ZzhDjXBttNs9mO/9Em+WZ6+Ezr8KlvaHGOLQDlRpDsHrAm21ChS5KUlO992BHw3bjCF1AMeUXAq
	Hdqurb2puW8VFey5foths192bAkt2Wmg=
X-Gm-Gg: AR+sD109xgnx2SBTzMRCbzMudBFdon+fSCE/HoaOwdfIK/d1RAN93MiMI1p8P5WRykf
	VUsVw7i3TGYpY7ZcojGlXkRSnXJzb/WsCb1KQluPH4qDEs19YRAmbJ/Xsqvx4jcY9RYdK9eM3Ik
	+P1KqwxpQzt+xWZwcOJ2kdlNtRYNmbZa+9AEKN3C52KMTowRW4IlEauCXpzN8YVhU4nxoCZr9bd
	gX/ddvlI/0Yb8ln3/YH/h3Z/q3tNBpgNmVKWiwled2+5LVy4kbgWSr7PWp5egk=
X-Received: by 2002:a05:6820:4b85:b0:6a3:1e40:6332 with SMTP id
 006d021491bc7-6aaffc6e253mr3887480eaf.59.1785055872371; Sun, 26 Jul 2026
 01:51:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260711100956.4351-1-yangtiezhu@loongson.cn> <20260711100956.4351-4-yangtiezhu@loongson.cn>
In-Reply-To: <20260711100956.4351-4-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Sun, 26 Jul 2026 16:51:01 +0800
X-Gm-Features: AUfX_mx1gpab_zKwSKOhb9cCFWLVj1GDITEpZB1e_dlRrpj8YkBDPb0g7Y5wMfk
Message-ID: <CAEyhmHRPsBC-XUzkrvpCf896yzZF3fxV_AvrDZW4200qrqhi7w@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] LoongArch: BPF: Split unconditional branch JA
 paths statically
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 6:10=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> In build_insn(), both 32-bit and 64-bit unconditional branch JA paths
> currently share a single case block. It relies on a runtime condition
> check to multiplex between the 'off' and 'imm' fields.
>
> Since the instruction classes are already resolved at compile-time via
> distinct switch-case labels, this runtime check is redundant.
>
> Split the two paths into individual case blocks to remove the redundant
> runtime check.
>

Though no big deal, someone would argue that the emit_uncond_jmp() is
duplicated.

> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 5f32b205a6ac..69bc30f88c44 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1150,11 +1150,12 @@ static int build_insn(const struct bpf_insn *insn=
, struct jit_ctx *ctx, bool ext
>
>         /* PC +=3D off */
>         case BPF_JMP | BPF_JA:
> +               jmp_offset =3D bpf2la_offset(i, off, ctx);
> +               if (emit_uncond_jmp(ctx, jmp_offset) < 0)
> +                       goto toofar;
> +               break;
>         case BPF_JMP32 | BPF_JA:
> -               if (BPF_CLASS(code) =3D=3D BPF_JMP)
> -                       jmp_offset =3D bpf2la_offset(i, off, ctx);
> -               else
> -                       jmp_offset =3D bpf2la_offset(i, imm, ctx);
> +               jmp_offset =3D bpf2la_offset(i, imm, ctx);
>                 if (emit_uncond_jmp(ctx, jmp_offset) < 0)
>                         goto toofar;
>                 break;
> --

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> 2.42.0
>
>
