Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E262E5B3B
	for <loongarch@lists.linux.dev>; Fri, 18 Jul 2025 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752856079; cv=none; b=BpBDA7EZ9cp96k/yPzPYzaLIDcpTRUEzRhttl1KSzp4lDTZdf5gYiml8mZYGT35b6sYs7gHyBbmaOEi1kagtsdlUYjgLWKBDSsjrLhZoTbyBfov+UHTAeNdblUeyLBs4TeoSNkVSSxcpTupmcQu9w6VBi9oAV3wt5xd8m9T3AgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752856079; c=relaxed/simple;
	bh=DXVe+YIvbDk+iHmTC9B2kIt3ATTDC3AUB7tRGoHhmak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=N0rILa31+tqVD5XaoHl4FwK8mpQdwuBgfbL5MydFfHMrbru9495tah+jiaS81oY6aTDzw9hpp58Q+Ul3faiXhIvCqJrExAsvI0RVMx8FT42zMpnVJ2fXzw54zdo6Crz0kls0dVPSyUDF4VW6mwWB6BLW/7RlVcW0iiE7eQWmuJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJUQWJCP; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJUQWJCP"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d7f2600c17so324209685a.0
        for <loongarch@lists.linux.dev>; Fri, 18 Jul 2025 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752856077; x=1753460877; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0st+wJfjP35sjKF844IhgRNQZND9uZXzgJZrH98uwMc=;
        b=HJUQWJCPWI/5ZGjH1W8iADLcT/IWo8Lt9HBjVbz5b9Do34060DpdsCAvOh4wD6xpyy
         dxXiEyE6ECZxuC5gjJQ238gwxvvy5hgbI1vNvRsNJOtiH/1tQmq9jnIFsGXqgKFWoy3A
         +nH4fR4dc0mE/kcnzjNDVGnoUlBUumA5jEQXNzi+85sdyX/gBXxhHxWljgZ8QMBq+CuY
         drr8Bb1cM27mZkQKk3lvy6jYdAeGdMkHCe9AdKYK0hmFiFlfYQJYiZnBMoLQhgdOZc8h
         LnuK7dNLY82FJhUM4GVItD1fDx0EHiHkyHwsvUwcKVbEdYInvVnDo58tfvXIqe/7WSG4
         uQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856077; x=1753460877;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0st+wJfjP35sjKF844IhgRNQZND9uZXzgJZrH98uwMc=;
        b=Nf1VU3El+d+3rRbW1oxfBzqc+812g7JGspa5TBmeLWWgYlvYTdzbScgobOKMb/mlVK
         38ykSy003khN51Q21SgvfgvrHmJdDQOQdU9n+Dhn42I/RjGdFAWLuuhC4jppRSAsMOuz
         +oSUlrfu68OCXxIkGb1INPLiMavn5Zc/sQZmLgkmfkDsRUG6YVrvlntHL/yn06X/rt7I
         RpMtrdS1sQhG51ZDXkBGi2z4c41GqqiD2GOGPRUwDrspnhNjdwfLk3csKTNrs1v7HkR+
         UrkVKH5HUBrRnNpE9yl8ikZ7vMeDBMYa5Y1tsHJiClJBETzfFYel1Aqs7kCZ4xtx0G6c
         ikIA==
X-Forwarded-Encrypted: i=1; AJvYcCVqF7lek/6h9J+XUgzhEwWtoVakYwI20voDm8uaqw+Av5aEUCsxafhqJyRPJMpihKCP0GfjTNObTZA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwR3666zRYBtTVLHUBZPsGNGo2hB+0Yl4tkWwMx6vX7tVK0oDCE
	VE3vHmHPrGGbV1mNg3auzhm6Bs6JLS1g/CCLgqH6ZrorBdFRoLjPR/2F9Q5Y9F9rKGIU7Ysf3AV
	niNv+z4AuvKbDNpW0qIni962oh7tUuYsXHNBO
X-Gm-Gg: ASbGncsje060n/Pu89ZqyH3l6g9xdcCTsUFSJsQlI7v2rhUYfeZHzGiWHz2Xy2gSulf
	20W+fVvS3H10sLWTFvcx6BUrMSvKQdnJ7fRxEf8ctE92tR3CA1VE8/2lz+HKIU+vlayhiA0RWmB
	a5T30C8RHCo6nGrZRbAN8rrF0vN1oPHG3gUaZ09ozNx40HudgasXT9pQHiOjx80BCOiTOq60a/G
	janf3ZknfVr5Is3JiZVtIZFSPGtjrwaKhyBwZaM
X-Google-Smtp-Source: AGHT+IHJrkqzqFoX+imrFS/gDENYvMM+ku8b444DIPXOFEAgeXp66zXTJyocCIE3EW6/VceadbBc7XVtp6aKER5mRSk=
X-Received: by 2002:ac8:58ca:0:b0:4ab:95a7:cfa0 with SMTP id
 d75a77b69052e-4abb2db97damr58242741cf.55.1752854538292; Fri, 18 Jul 2025
 09:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2z9ByGD5wnk0=C=vML-OTv_22jZr2dn3u1O4Bs5V-YceA@mail.gmail.com>
 <CAK3+h2ybn=0fx2fNOerW1Ngy5fC9WX2NRNLOhGnRh_wRr5sghg@mail.gmail.com>
In-Reply-To: <CAK3+h2ybn=0fx2fNOerW1Ngy5fC9WX2NRNLOhGnRh_wRr5sghg@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Fri, 18 Jul 2025 09:02:07 -0700
X-Gm-Features: Ac12FXxup4m8g4LXjuUqX2snNJYLIFrCTo3abmBrk4hwKKh5O7DWDiD6ZLI5a0w
Message-ID: <CAK3+h2y9vqy777=uTO7K==0eqMor16OKx5WTM=qs3=OM1sFfAg@mail.gmail.com>
Subject: Re: loongarch *ip in bpf_arch_text_poke() missing 5 NOP
To: Chenghao Duan <duanchenghao@kylinos.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name, loongarch@lists.linux.dev, 
	guodongtai@kylinos.cn, jianghaoran@kylinos.cn, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 10:00=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
>
> On Thu, Jul 17, 2025 at 8:12=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.c=
om> wrote:
> >
> > Hi folks,
> >
> > Open a new email thread to investigate why  *ip passed to
> > bpf_arch_text_poke() missing 5 NOP. from what I observed, in x86, the
> > *ip already include 5 NOP when passed to bpf_arch_text_poke(), but in
> > loongarch, the *ip is missing 5 NOP when passed to bpf_arch_text_poke,
> > which result in -EFAULT in bpf_arch_text_poke() when memcmp(ip,
> > old_insns, 5 * 4) in loongarch bpf trampoline patch series. I wonder
> > if the loongarch bpf jit build_prologue() missed adding 5 NOP? x86_64
> > emit_prologue() adds 5 NOP, what do you think?
> >
> > Thanks
> >
> > Vincent
>
> I applied a rough patch below which added 5 NOP in build_prologue, it
> seems to have solved the multi XDP program attachment issue, but it
> also caused kernel lockup right after the program was attached, I had
> to hard reset the power to reboot :)
>
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 6820558afce5..66b00e265a73 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -93,6 +93,10 @@ static u8 tail_call_reg(struct jit_ctx *ctx)
>   */
>  static void build_prologue(struct jit_ctx *ctx)
>  {
> +       /* Emit 5 NOPs for later text patching */
> +       for (int i =3D 0; i < 5; i++) {
> +               emit_insn(ctx, nop);  // 0x03400000
> +       }

[0] is the email that on x86, 5 bytes of NOPs are added to the
beginning of every JITed BPF to make BPF trampoline job easier
I think Loongarch BPF JIT could adopt the same idea, Tiezhu, Hengqi,
what do you think? I wish I could come up with a good patch to not
cause kernel lockup, but that is beyond my bpf jit skill :)

[0]: https://lore.kernel.org/bpf/20191114185720.1641606-14-ast@kernel.org/
