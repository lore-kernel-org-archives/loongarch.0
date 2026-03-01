Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0E521D3E4
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772346743; cv=none; b=QwLAi9EqAChjR9dc5oG8DPa3ZCTQr9u6p2P5TwVvRGkm6ZtvnHAFtv+niIsdetY5AXexFrlj2Iykzhf1gRfh0Z6v3VRZbriQE7L7JLNSHzlbHRiEFPaLqb25kwO9O99F3eDroqvL4kGK1fwAcmUf1wFM2n6Aa0ptOrudn3MBbeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772346743; c=relaxed/simple;
	bh=TqxBh2p8iwhTysf0T9JFQIrXHKi66jGKvtWigiD8xiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKZ8xdVi0KFvAgy4Xmlowi/HNflBf86Ze1fsCWLmOfTGyfhiabwUQB7GRaRZu95HArgMYt5Z/KRBfCexG7JJAJinpCNRm+PCQ5/nwrEKha74XscHomMu6KxTH915ldUxswE1Wq25jbgep8jvKzswh1hAjUs7/v3nfbwNYOaKWkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5XogwF4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5XogwF4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1708C2BCAF
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772346743;
	bh=TqxBh2p8iwhTysf0T9JFQIrXHKi66jGKvtWigiD8xiU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P5XogwF4/KXTK0/iLiAJL1PXflyo7fixxUxNvtJJwS+fxj4sxft0WOxKLKSUKJUmP
	 pPwtTlv8kWZunflgHcbCM9nVXii8urog6/wPCBdEuTakjVOSSCMJywFLXaCz4316RD
	 f2zp+26go0ziJIxBlPPR57nOADF7fqSi/NV12u3uoYn0VuAh2+jGEL8E2BEIS8TFE6
	 CmIgwSWhQY4u+bqyj6cAwrEHJryf2tCAoki9OgTKjzgjiHXqcWQ3oGovFARiU7lfuK
	 vIyucYxztTMavERhuPDp+i8xbv646TqwsOUxvdtlPBVKPZBSXgosdkHbEAAUOqTsIM
	 8L2LokXOBQZtw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65f812e0d93so5297043a12.2
        for <loongarch@lists.linux.dev>; Sat, 28 Feb 2026 22:32:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVmPPEo2Kbk+qmL2z7F5ogJ/XHd8OgCq6GKj0wfB1Qr6rl8it/4vNw3XS3/uYkIm3+8pG43TDQiHRQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzzEobtr38WZqHw4/pt8F6VW7D5TqGxenlwUl4vZhuzYAQ5XBn
	lwJLpv9MAemEsm33mlT3nBSudgLyDoaxbfriX7Z4vd8UGifElGTGDDNDSISbi/UNF+KdAAcPyAS
	Z7KxUJf+U6rsWCfIEvkFvcnM9xJZTGBU=
X-Received: by 2002:a05:6402:5113:b0:65c:62b6:4be5 with SMTP id
 4fb4d7f45d1cf-65fdd4cc062mr5104870a12.3.1772346742204; Sat, 28 Feb 2026
 22:32:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301012744.1685320-1-sashal@kernel.org>
In-Reply-To: <20260301012744.1685320-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:32:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6VRe5NRpBjo-_FBoDDvJmq-jNCYbvtdPZ-j_TZzFzS4A@mail.gmail.com>
X-Gm-Features: AaiRm50oAUpwLRrnZu2pQjh2ya2n9b_I6Cqis0M5D-p0oiLJEPONeIls3Qd1R84
Message-ID: <CAAhV-H6VRe5NRpBjo-_FBoDDvJmq-jNCYbvtdPZ-j_TZzFzS4A@mail.gmail.com>
Subject: Re: FAILED: Patch "LoongArch: Use %px to print unmodified unwinding
 address" failed to apply to 6.12-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, yangtiezhu@loongson.cn, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Sasha,

On Sun, Mar 1, 2026 at 9:27=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.12-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I'm very confused because it can be applied and already here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tre=
e/queue-6.12

Huacai

>
> Thanks,
> Sasha
>
> ------------------ original commit in Linus's tree ------------------
>
> From 77403a06d845db1caf9a6b0867b43e9dd8de8e4a Mon Sep 17 00:00:00 2001
> From: Tiezhu Yang <yangtiezhu@loongson.cn>
> Date: Tue, 10 Feb 2026 19:31:13 +0800
> Subject: [PATCH] LoongArch: Use %px to print unmodified unwinding address
>
> Currently, use %p to prevent leaking information about the kernel memory
> layout when printing the PC address, but the kernel log messages are not
> useful to debug problem if bt_address() returns 0. Given that the type of
> "pc" variable is unsigned long, it should use %px to print the unmodified
> unwinding address.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/loongarch/kernel/unwind_orc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/u=
nwind_orc.c
> index 8a6e3429a860e..d6b3688a1ce97 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -494,7 +494,7 @@ bool unwind_next_frame(struct unwind_state *state)
>
>         state->pc =3D bt_address(pc);
>         if (!state->pc) {
> -               pr_err("cannot find unwind pc at %p\n", (void *)pc);
> +               pr_err("cannot find unwind pc at %px\n", (void *)pc);
>                 goto err;
>         }
>
> --
> 2.51.0
>
>
>
>
>
