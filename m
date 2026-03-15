Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3996770810
	for <loongarch@lists.linux.dev>; Sun, 15 Mar 2026 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773561976; cv=none; b=sU4Dyc4aElM0MOm2E1jEnDxPgDCY1kvwKIVxobQ3CzXgwRRxCfHnFJ1/cBlfjFurO4TrBa5Fc+KgUK5GLZk5EnVPTCrsPoXnYGpzto2sX/fWo5f1id2t+TQI87s+zsOpahXJG4qRTV4EKInmAQ7iT2UEuu95LGIV3gIgH3HUpg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773561976; c=relaxed/simple;
	bh=3T6KWEf4HpvJSVpqJekP3KIC45ewpQIIio/JBXvJvek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfNFRwE4HoxYd2kef/r5p83CZ3yuUfQos1MuPVbILKCrTlrw5qaQlIZBxHsWmXwNiXVDY7fkpEiQbsVzR4Aux6dsYHqRTlbjjE79xjrZWR7f9ROQk8/iFAZMYMhABdXF9/XbIt/N3X4DhUIfY2t4JTmOSO8NxBS8pZAahMUSaT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EetEdAN1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EetEdAN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF7DC19424
	for <loongarch@lists.linux.dev>; Sun, 15 Mar 2026 08:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773561976;
	bh=3T6KWEf4HpvJSVpqJekP3KIC45ewpQIIio/JBXvJvek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EetEdAN1mQ+RA/+82df1hJjhn2qGLmv7/2cbpPvNnEmEcouBU8l8F1PkLEQTtdzEK
	 otzcTTDfYtA3b2Qjd/EPaBSBeEvFtgSjGqYgictjNmMOugCqIH6Jo2/CHPbIA/1dxg
	 TJNDCOkIvtQHy5f6DSRbybSXazyZqqGDOHojb1VPMUcB2FWV5VSOj+5tGMFbMFENk0
	 zU5tBnd57i9ggX+yG4dXXXqvkBEuGO9jPyalZHEHNZmF8aQX9V7G1MZCn990MLqXF1
	 sz9l5eyp8SK9Gy+3chCD/vjznWW0h65hwLFqaKUqsb8szScYW+tcUY999hUB4cdvH7
	 opm7PR1qusKdQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-661568ce781so5211010a12.0
        for <loongarch@lists.linux.dev>; Sun, 15 Mar 2026 01:06:16 -0700 (PDT)
X-Gm-Message-State: AOJu0Yybh0ldxhpGxzP1U4uIfcFh6g4KUVGMwjZZ45YO+1wZYXoc3uyf
	vJGlekwJ10exPBh60+/mi2FEkn/lgIO+w/Jy6E0rhK/x5NcJAMwjAW/7W53sRZRTxIbmmde4QVH
	HSmIXTlDvVGUET9pVShzDOi3oI6r1Dgw=
X-Received: by 2002:a17:906:1393:b0:b94:2ba7:d606 with SMTP id
 a640c23a62f3a-b9764fcb283mr376164966b.5.1773561974557; Sun, 15 Mar 2026
 01:06:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310065510.8189-1-yangtiezhu@loongson.cn> <20260310065510.8189-4-yangtiezhu@loongson.cn>
In-Reply-To: <20260310065510.8189-4-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 15 Mar 2026 16:06:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Ub0OSQ0y8hg53O0-ovhCJxjLEw1yOz7DUtm3=w+JbHw@mail.gmail.com>
X-Gm-Features: AaiRm52KZhpYuMhEs6_bfQnv_FTZDzmpVlQRkuEXVc4RcRotpsmzvWgk-DMe5yg
Message-ID: <CAAhV-H6Ub0OSQ0y8hg53O0-ovhCJxjLEw1yOz7DUtm3=w+JbHw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] LoongArch: No need to flush icache if copy failed
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied with small modifications (return ret rather than -EFAULT), thanks.

Huacai

On Tue, Mar 10, 2026 at 2:55=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> If copy_to_kernel_nofault() failed, no need to flush icache and just
> return -EFAULT immediately.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/inst.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index 77da3b886dcb..dd5e8864eff9 100644
> --- a/arch/loongarch/kernel/inst.c
> +++ b/arch/loongarch/kernel/inst.c
> @@ -246,13 +246,15 @@ static int text_copy_cb(void *data)
>
>         if (smp_processor_id() =3D=3D copy->cpu) {
>                 ret =3D copy_to_kernel_nofault(copy->dst, copy->src, copy=
->len);
> -               if (ret)
> +               if (ret) {
>                         pr_err("%s: operation failed\n", __func__);
> +                       return -EFAULT;
> +               }
>         }
>
>         flush_icache_range((unsigned long)copy->dst, (unsigned long)copy-=
>dst + copy->len);
>
> -       return ret;
> +       return 0;
>  }
>
>  int larch_insn_text_copy(void *dst, void *src, size_t len)
> --
> 2.42.0
>
