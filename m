Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7E97080C
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 01:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753926279; cv=none; b=cXDoMO0INRvzYi+Q7Xi+ZMrF4wW3D1EGC8DhTRyNVTHS5tuju7o6xs4xj/CMXnXPEZqMl+H5QGViE48Zy4+pdlcQWI2k3y3PYaXSY3sXyOwkt0qHwllFt7C+SifLwsrVMu7HGwvAr7Wpjqq5sTp3v4BrXTKBpBGJIzl14AqCRbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753926279; c=relaxed/simple;
	bh=PXcFVb3XfNEVPp/Kfyksg9teOS85x7QJyRpu+lxqObY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3l49SFwEPF0NNyEOpFch+OcTuE7dQ2gyxhLTAIj+DpqII/rs+XMC+0NXBxhNP7kh8sbCCugN807Hj3E44K1ZvCrDJvtG/jyetbokMt7V2QYhyg3Fz81ApjHsnuSfmOWBBguBDyqFNZz37pza+wARdDScN4pn1DfiecVnGwoFQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsQaT2ge; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsQaT2ge"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-60402c94319so241170eaf.1
        for <loongarch@lists.linux.dev>; Wed, 30 Jul 2025 18:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753926276; x=1754531076; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvqjHObjQC7JX2Ub4wOeZhni34SLZZkthzxU3aytJEM=;
        b=RsQaT2geRjks1dw3a+Fe5byVmUYYkMxTc0BtxJQEFSQ6FGwB9RGbRjtNyh9L2dNN34
         J3U93p39bCdr6mqC+5t53SRGNqNbXCfvmWMG0vf4EcM4j3GqZuDItXmxrcCAu6r2Ui9I
         FaBvTH2v8Tm3+a/oT8PPlpcECpvyvgKMEy8LOY6OxrIdG2PabI/puZ+6NCP9ezkzXbJU
         xgSZHxfsDfZIRuD6Tn7p9y5xrNLSgsLF2p720ddX11lK7frdNoqQTBUl8r6o9APDjRWe
         XXb8e4z8lnjTQMgSWy5AMp+GrSyRrH9CHKcA3qmoA/9d28d9Ub5fx3gaQzRC9M/IctPx
         VqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753926276; x=1754531076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvqjHObjQC7JX2Ub4wOeZhni34SLZZkthzxU3aytJEM=;
        b=NXY86ZmBGgIckowd1L7HlhW8J3J8a4ak/SwKhqzJk2yHNlBaXnDYRR53unenuDjh/O
         NtyWuwUMeT35+DAieOembs2DsGhiZhCQYnFsIWI10A35sctgQN+IoEpCB+uO0J/me3Dk
         eVaoYpyXZB5zeiG2BnyeF62KmbLGXFNSnALulnF73DLKXIObylBvph+rHDkf8g123ncS
         RvZyenUoNNGewWe44QnOGPEHynYvnBjECKMtzpWlVl4FCf2ypkIq9YofbVGzFHLA+EPz
         wXSvdDTe2fIjxfOKRXCY4QKJ9NuVml2S/fpR+VuYiCA0A7bOd4zBjCcHBF0A0+CegUZ+
         RPWw==
X-Forwarded-Encrypted: i=1; AJvYcCVqDEzdRN0f3YMDaTT7wo+TAxDClor9OpoTsuaLtUR+MX7lDzayFh9JepR+syYXlAHJRM8Jx526Ek8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAcBw6IbKRScV4gnS1p1I4BqAIP6bcTlCMfrw0Q228AL1na0rX
	qsHGMzdVD9g7uFk6AlTy0F0ixLTFREqrm0Dttc6pURD2c6m9rnFU1WOqCGPqoOyG1Spo5BzSSM+
	QIjyl0o/Td06mD4m9apEOAjTvvyM9er0=
X-Gm-Gg: ASbGncsfk6FddGtOJ0yrWP6Bab6T7wbR6FGLUboLF1svrQSvpLKt2JoJoHvsbgl84ov
	+tx9U4y7OOiBwVV+mn2UrV6UV7cwzj0zpXYlW725pMfSV2qEw4q/LvdIkQfMJzHWlBGeMp1wUsW
	XNIA9kX+bzEXpIS52IgKNhs4EyTAAT+ieEnagWXm5CDsGLZNi9goFzl7qBWgv1OReE/Z8vptLJx
	NwhWz8=
X-Google-Smtp-Source: AGHT+IFqiRnMtLMxFx16WSrBf6XJxsgbu5jgcccCl5t+5itNCUcmqyUoKLelAaghTDww78kjcfJl+bfst0NoWS3TiK8=
X-Received: by 2002:a05:6808:1521:b0:406:697f:a62f with SMTP id
 5614622812f47-4319999e1e4mr3911664b6e.10.1753926275877; Wed, 30 Jul 2025
 18:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730131257.124153-1-duanchenghao@kylinos.cn> <20250730131257.124153-3-duanchenghao@kylinos.cn>
In-Reply-To: <20250730131257.124153-3-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 31 Jul 2025 09:44:23 +0800
X-Gm-Features: Ac12FXw2Om8UPwVFQYngJybFlYBDlP0KxfqNZ7udcHhvklhAejZcvU7iATJRcmY
Message-ID: <CAEyhmHRzvazN06DsrqTO9PiBj7kJpZ3XdcOpxE2khjaKaE5jZQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] LoongArch: BPF: Update the code to rename
 validate_code to validate_ctx
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, chenhuacai@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	vincent.mc.li@gmail.com, geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 9:13=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> Rename the existing validate_code() to validate_ctx()
> Factor out the code validation handling into a new helper validate_code()
>
> * validate_code is used to check the validity of code.
> * validate_ctx is used to check both code validity and table entry
>   correctness.
>
> The new validate_code() will be used in subsequent changes.
>

I still feel uncomfortable about the subject line.
Hope Huacai can rephrase it when apply.
other than that,

Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>

> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index fa1500d4a..7032f11d3 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1180,6 +1180,14 @@ static int validate_code(struct jit_ctx *ctx)
>                         return -1;
>         }
>
> +       return 0;
> +}
> +
> +static int validate_ctx(struct jit_ctx *ctx)
> +{
> +       if (validate_code(ctx))
> +               return -1;
> +
>         if (WARN_ON_ONCE(ctx->num_exentries !=3D ctx->prog->aux->num_exen=
tries))
>                 return -1;
>
> @@ -1288,7 +1296,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>         build_epilogue(&ctx);
>
>         /* 3. Extra pass to validate JITed code */
> -       if (validate_code(&ctx)) {
> +       if (validate_ctx(&ctx)) {
>                 bpf_jit_binary_free(header);
>                 prog =3D orig_prog;
>                 goto out_offset;
> --
> 2.25.1
>
