Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B992338228E
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 02:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888064; cv=pass; b=inaRY9mwltrkLclqT7+xfKQGOeoNA1P+CJ8vUor9hP38J26dtl0/2q79fE6DORJyBgIrAid4ci/nEjxFt56Q1WohlzDh6OnJoaUcrIM3JcUiksP+nHY41TiHBDtOyFmvtRAwRn48VC7Y/hpAZXS6f9mpkgau3m0kcUo+1GKhrvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888064; c=relaxed/simple;
	bh=c5N3mUWsqqGkGvpcQTGOpCA71T/cIDG6988WWP3pjnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7VKxMWb9WxrsCLG6qwNQ5gYysrmqpl/e4GOvNe55op7Hszq8/JmzunfUIyDhlh2+/m7aO6zXs73U5yz/4OVf781bEoFOMhLF4+O2S5AUreO4QbZXoswVJaBGH3kHnm9XC2ARyXHHLOhnZsQWZNByfq/gIgXcXXrOZ7sbXQxq50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3ffZd3Z; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3ffZd3Z"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-660dcafc85aso1087036a12.0
        for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 19:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773888061; cv=none;
        d=google.com; s=arc-20240605;
        b=YdKtO2ED/XVk1v6Ahsm2Q6ZcN9VfCPUTXxwlP6fOfDJ5rWJFIeeQEYcecnCAswSylc
         QUZlE9M80vv7MbToKkLdu7N4nHKY43UxK5oLipTitaQiCfezlxqDF+CR+KJKxwl2qhHa
         0ga0jPsaGpC0Ej+zBganE9WiNzJ4gWbRQSPJVu3XMX6A0h0GdD+rTVipcl0mwCOC1bnf
         0jxWSmokoUCCwqlbn8FPhJPCYyw6ysyTRc60NSGNH6Wj6v05L2JcbtX5gp13o+P2etRQ
         wtiVlSeVwViCA2z8NOHqt25zw3Ghjia+uCl1WzZukIiYUZNSYR7NsKER7JE6Xd+tNxs9
         j5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iiPUX+Emor+hszC9x+3B9VAzKOoFSk47962r/7/1wUw=;
        fh=rRWiCFdAXOt+O65y5bXzuTWZ2I1xev+sSMF2ZCSknZ4=;
        b=OD9DOM2BlnMXxkxtIdorLsNkOqC159hI5go7PHMJZMbHw3d0TarppTsK26fktnbNZI
         ++lfNCEmTSWUp8Rriq3b7ov+qaGGX/bsBRXFo2zfWIypxLCqDTADJzdrOAig7hL+msCH
         pcxgdXDW61LH+jXYYLhQLLPdLnzrEulwInAdJEtvqLde/5o62L46l40PTVD/bVbU4TgB
         8ry6j9CoZ5N1c7doqbvk7XvkVc44h+7+zDlT8HIOCoJKpborXKbbMuBkpzwbNnLF5rEX
         h0+N6OjV5WxJ/BPDj25UjyvVLlUvcY9p4++dkG6MqNQrPCYVJKWUiuNVtaw9iy1ZKJ+o
         DeUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773888061; x=1774492861; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiPUX+Emor+hszC9x+3B9VAzKOoFSk47962r/7/1wUw=;
        b=F3ffZd3Zw9TluXNjsq8qQwVbEG40U2SJq+LR/y8lUKwB0umKrrd4jmwoAwLuGgfa3p
         J+JLwHCn/DVWzSIcmBvDP3PQTbIWcjNvqjr3pTnhVaYS4B2xU3hRaDxK1PJ3Dqzj3WPK
         wFtkcmv4A4EwVZJkoh4Gzy4W1gbOZRoa9Hjda3julqmH5cBA4uOpPsXDD1IHk4TEa4MG
         7MIar9OCbh9rAgjL905KB1MhRv0qwhtWZmHk835EVIZ+9N6JaNq9jTtOwOJMyzJpxE0j
         XNDGHg2e4Vjy+bJ9vVEce6EqRhMvjIrTmNNjWNBeXdlaRPOSFn5zIMGKW6rzw82PtUXZ
         GoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773888061; x=1774492861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iiPUX+Emor+hszC9x+3B9VAzKOoFSk47962r/7/1wUw=;
        b=ICYoyVy3BiFmc5m/v55lKuCNx2hUl9u0eFp4rjeB4YD9nKFPwWlBUKo9cZFl0ZpL96
         cEpgGkEj160TFOuAT7q2e9tX1inMnJGkXpm3gLbFicOhq2ynFvskDBeYO6bIVJs+B7JH
         VkS7qJD2FqcWKtuV4gsF/IV5bmUDA+3jZWkkNEzEXJgR/9KNy1/JTDM/6DZx9CdKBw+E
         cUlaji7Xg99qBOR965LYKyxXy78UK6HFWTQkmekX9J9GJz/SwJvpiG/PCcM5xxTvKR5W
         oJ9hVxMTMbE+NUz9RRK+U+59xVZumRC+KngljC0Mg8zaxRB/ocjIF1s+dcoQtX6aEzEA
         4cog==
X-Forwarded-Encrypted: i=1; AJvYcCXehKsqjT75ot5kGwMVAXtBXqKtU5wbak+jju3iHKEv6EhqRKANtCgan6SlFRYVvMlFkgdV/mLrcSY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLmzui5gxBkEqyB0Gd5GzK+jnV6Gr/zAep97dL0eiMGjeUMJSx
	FahrSZ2zMkooBnrpDcMhlFbfDKZ5CJUGtwyZa2O9lmv6OWFEmzpz1OQlLongAr4TrTPIzrFjUXr
	Nh4eH5a2ggMHmnS8yDw1CauTvczRDxIw=
X-Gm-Gg: ATEYQzwnQ2jCWTtawPZRBkLORzeWysUKVV+DGjR6vG3WqGqJyVyMyhvK7A+s6Fr0IAR
	hZxSS89JRxXsmxQauu2qJ9aTiljrXQU/S42gOzGNWyqOaX5fyv+0J7ipLTFEG5K6KkGQsPyeG0d
	vXK1wt0/sMzLok9WZXT3FJNhOGTV3C83ePsUVhXFX8e4ROzrTfbMxR7MspWpyvxE8PmNX5L2O0h
	W+wDr9Vx0CWLUdqVg8UMRZkt67NkgK8fOUXeFzuPoK6MiOPgqnTUgjx+ZJfj2v1mfq3JggmOVw4
	DYaW9xMIrtQaytAPrN+C
X-Received: by 2002:a05:6402:3719:b0:668:599e:103b with SMTP id
 4fb4d7f45d1cf-668599e124amr432824a12.6.1773888060739; Wed, 18 Mar 2026
 19:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260319005326.3796676-1-lijun01@kylinos.cn>
In-Reply-To: <20260319005326.3796676-1-lijun01@kylinos.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 19 Mar 2026 10:40:48 +0800
X-Gm-Features: AaiRm51-q76xrG91vidaCcVqdVdof3oUdii1Xa9kw6VNvQ6UZoQt2zIiQZgJDzs
Message-ID: <CAMpQs4KoYxW9024vQ=24rYOzN5Qg-L+RYR=bx7LtaTkETuWYaA@mail.gmail.com>
Subject: Re: [PATCH v2] Loongarch: env: fix missing NULL checks for kstrdup
To: Li Jun <lijun01@kylinos.cn>
Cc: chenhuacai@kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jun:

On Thu, Mar 19, 2026 at 8:53=E2=80=AFAM Li Jun <lijun01@kylinos.cn> wrote:
>
> Fixes potential kernel oops during early boot when memory
> allocation fails while parsing CPU model from device tree.
> before return -ENOMEM, of_node_put(root) first.
>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  arch/loongarch/kernel/env.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index 841206fde3ab..c586de80027c 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -49,6 +49,10 @@ static int __init init_cpu_fullname(void)
>         ret =3D of_property_read_string(root, "model", &model);
>         if (ret =3D=3D 0) {
>                 cpuname =3D kstrdup(model, GFP_KERNEL);
> +               if (!cpuname) {
> +                       of_node_put(root);

Replacing `of_find_node_by_path(=E2=80=9C/=E2=80=9D)` with `of_root` avoids=
 multiple
calls to `of_node_put()`.

> +                       return -ENOMEM;
> +               }
>                 loongson_sysconf.cpuname =3D strsep(&cpuname, " ");
>         }
>         of_node_put(root);
> --
> 2.25.1
>
>

--=20
Thanks.
Binbin
