Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177E01D63F5
	for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 01:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756258067; cv=none; b=bUYUVLosG1oHotRn1id2xCDLpy8VrbMZ4KF/PZqzdjoNlAgZJ3jePB/s91nQ3qT/eT/0IY0CI7Kv4dOpu3uc+zuHedVFhP/zlsxEX9pspclhWsJG7fUjXm10oSKPzrjQtMlAup6EeI4hh4ln4WDqauaLhRkecYKstes26oqJgYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756258067; c=relaxed/simple;
	bh=gI6Q4Kyq1mNp+NmEvmHD8jeVYE/sXBX5uM2/qQUg5K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AWLuj3SSc1l9Nfov6j7scFy5QMJ7QF1q42koxnwEJfOoLa/JSudFE9XDIN2E85JnwHAXxyujFDfJ//hwVah1fb/IC5QkSU9TAbczIppUnneZzfTLUcqf7MAJQqXGSSert4A8UBj7MuIucjM+60gpM6N/eFNoycC2c1JFcR3eNh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMvujM10; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMvujM10"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-435de7a93b5so193311b6e.2
        for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 18:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756258064; x=1756862864; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmiNjyEr+Wx48a8h5Fef3wHTELiSArVsPhkw4HBK1jY=;
        b=UMvujM10i+VQoa9EE/Wz5dm/MArR8RRF42BcKhTldkeYtTUCmc8S1bdVfEWg+mVpCB
         Vh8qn4BCLSuxVpz1uHWMD0Ge7D+JBUP35+ieG2zQMSkJ/82+IsTWotgH/wJOodXj8/0t
         l+ucyOyb4aX4FbPAqbGeZRny+Y55N7K0FpC/1gskZ8veNtN/Xgsp6t1fdNnM3TfgV6wE
         7xwdih61Ad99KMDNXLszyzIydsrQIqMzmHsIFEar70E3ZrrX/yFQpJCq46j7BM09+YsZ
         ezErQ4jv2mMRYBRhInYVfUYMuMEDJd+s9T84uW0vJGgXokcmyEU0PUGo4y4zPlKBWF6S
         TgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756258064; x=1756862864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmiNjyEr+Wx48a8h5Fef3wHTELiSArVsPhkw4HBK1jY=;
        b=kJQlHaXfqH9njCrUFJG31Sk1Pxq/zxCb4kYyff5LSoBegd4d+7XNDAWQjvYXMqAzvp
         Db0f6GtmZn/PCxaISrM7GJPB2x4HSGETVYRI/8oTsMwah+STU0Upaf4U7u7yXzJbDPnX
         lcjm8Wcy4DHuAPoS22PDcXv1PYiAACxFTqe/I9Hip5g11nWXL4i+mcZOexTKH/cwqWg/
         uF5GtOcvqWybijuYrmQUeGCn2Z3RHtFS44K19snNlAXr8+fczd58ShrWvwkLem0VcRTl
         AMkHUTQfk5em7+ganxP2ePgnsJeYcQicNLJzdUdK6lCq+a6oxyw2xj0gvmnq8x6pyvs1
         ro+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8FdWbc3dvyjhEkJpU7VoN3HAwbJhEBggmuaqVk6GDeW3EjkH1SABqUvlhylz8da30VI2nSrgd1O4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyE1USPOM9UBCw+m8E4/SKObiHj/at58Cxj3vqyeAy+op5VnSg2
	06B73xMgbokJL7kR93ITAuX4ZfxZEkgR3TL2Ly+gBUFlHfZfOikXUc0Ps2PAdMd1CNjlkVE0gfE
	Ax87g5iyXQmXy64Igv8F2hgu3Y7tNRuA=
X-Gm-Gg: ASbGncvYeWQa1ZWsXrn+iZYJwOtBOF/Mp0I0pV7PMJhLklvDrl7ZP/YffaJwmVtdz1s
	LO49TjHoO3+dfvi6Ak+8p7K/V6dFqsLGQFkGmz8o4PXv1DNx4NtH4FqUhu+PIpG4IoLwEf+Qn3O
	nV6WpQ8ZIVs+plxb3lr5bhrAXdvIBue8cq+DV5iUjXcWT3Hj7/9Agfi9+JWvWMwsderd1jTvB78
	218RLM=
X-Google-Smtp-Source: AGHT+IEEyzDa8nMTU8gc2yQwg0keE1lzdDPmweJCAQoR33t4eLc21iOp+FGhfK9jEWkq1g7Rne8LNhsiwRAuf+gpFoc=
X-Received: by 2002:a05:6808:2392:b0:40b:9bd2:460e with SMTP id
 5614622812f47-437852c299amr11217178b6e.22.1756258063675; Tue, 26 Aug 2025
 18:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250826064906.10683-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250826064906.10683-1-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 27 Aug 2025 09:27:32 +0800
X-Gm-Features: Ac12FXznrgZke7iN7qtaD0Bfbegdo_XMoR0UrmGOBz2O9QkgvfaFRMlTIBGZOAg
Message-ID: <CAEyhmHQJcCvy2TPv7nwT87yS6y698WrECwd+xA9RjsCVmrVXvw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Optimize sign-extention mov instructions
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, bpf@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 2:49=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> For 8-bit and 16-bit sign-extention mov instructions, it can use the nati=
ve
> instructions ext.w.b and ext.w.h directly, no need to use the temporary t=
1
> register, just remove the redundant operations.
>
> Here are the test results:
>
>   # modprobe test_bpf test_range=3D81,84
>   # dmesg -t | tail -5
>   test_bpf: #81 ALU_MOVSX | BPF_B jited:1 5 PASS
>   test_bpf: #82 ALU_MOVSX | BPF_H jited:1 5 PASS
>   test_bpf: #83 ALU64_MOVSX | BPF_B jited:1 5 PASS
>   test_bpf: #84 ALU64_MOVSX | BPF_H jited:1 5 PASS
>   test_bpf: Summary: 4 PASSED, 0 FAILED, [4/4 JIT'ed]
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index abfdb6bb5c38..7072db18c6cd 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -527,13 +527,11 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                         emit_zext_32(ctx, dst, is32);
>                         break;
>                 case 8:
> -                       move_reg(ctx, t1, src);
> -                       emit_insn(ctx, extwb, dst, t1);
> +                       emit_insn(ctx, extwb, dst, src);
>                         emit_zext_32(ctx, dst, is32);
>                         break;
>                 case 16:
> -                       move_reg(ctx, t1, src);
> -                       emit_insn(ctx, extwh, dst, t1);
> +                       emit_insn(ctx, extwh, dst, src);
>                         emit_zext_32(ctx, dst, is32);
>                         break;
>                 case 32:
> --

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> 2.42.0
>
