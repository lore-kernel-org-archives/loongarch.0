Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F1279324
	for <loongarch@lists.linux.dev>; Thu, 23 Oct 2025 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761224800; cv=none; b=ePAAdTFHoHswZD8xbiQ1/9CUGdT0lv1G0GuUj4u+EOxsn3+Otr0aLgT3o11qGqnkD6v55mI3i44jm+NiDjTJRKe0aaw1lhnIIUyXCregM5PAAj+hG7a8ahBDG5QbxBuV15+Breajb0dzzHKpleF8hr32XG/caBEeAGI6IS5JTVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761224800; c=relaxed/simple;
	bh=XKOJhFGCqBF9bVYAL367AihlEIWrpoeoI1KIfUjxcfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfZaXH/CZ9duCTd245N6sFKGkLAj+CVVgoYxlgs7SpjLwX+6Y86r7uOA4BZH8CK47h34Lxxav1XEpMkBqZ9oFnJrihVHmPviuUhj6FiH3FJhsuqLoysaiJg4BcfbpFJyAtlFK1IaZt6nNSYdeq1Gw4C6dvmpb+vRR3cu+SNJ3IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GvdBKpnr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GvdBKpnr"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-592f098f656so1016511e87.1
        for <loongarch@lists.linux.dev>; Thu, 23 Oct 2025 06:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761224795; x=1761829595; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKOJhFGCqBF9bVYAL367AihlEIWrpoeoI1KIfUjxcfE=;
        b=GvdBKpnrXVe6pNRc9b1ugXRarLAtLyQ3mdgsENYmYM//50Bs5g/cZqMmD70QNHTusn
         ZJnXP3gBzxPbYmPv9naFzAZKNMkNADyx6/hEBI6EiqPiU6CmBnfRJiSROnCrZ5ZCMarD
         zj1z80O8qUs+64Jw7mP6S3Zw8qkKJOHffG+2Wt7BbEGkKnFjRLkWhGd7pYOZKnqQYjlM
         9v+l0s3ISh2KbYD7AxZp2LZSzSH8vy61u3h9nnU+cYmac0Gw3oXfOSjg8rcQ2tjn6sAJ
         pVZXMr6Ffeu4AugE6fhsvKpBi9vuh7+ia8RkgRZaQi9BZNVpdvLM+K271yTe5g2pkrMV
         hyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761224795; x=1761829595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKOJhFGCqBF9bVYAL367AihlEIWrpoeoI1KIfUjxcfE=;
        b=PhFElZOpJSgt4jFYNn2Da5MGCBjW2mXPF3Tw50jMfVuhLFWwmzsZAn4fwu6TYOgvcD
         0jFJ8qGDsGdfmIw7ZbmjUJFUtfAA2L83W19ryc6r994wNClut/Yx1Vx5jm6lLq57JAGI
         1cQffuq3qWKYDhfp7oRucL79RwFy1ASYFpHPoQ4lDWlHPwl8AqGBd8MBTLNDIPQ2l/lo
         YvWo7FTWRI/5cmct2tHVs+d2DIkwrKPTfonKPeVtgsHr8ER7Dd6kJ4zVb1TFTw+C6+4n
         sqWS/bhAKFo/1X1eZTN5G6SMSZCSB22dVpMaiJwTQTdRHdp/yCHVPNqBHGdwrYO68sOJ
         UYmA==
X-Forwarded-Encrypted: i=1; AJvYcCV9mw4Xd8i38hkzbHKGSHMz+///T2D6Qkdrkm5/O/hR0DdmGDL/qCjMrPwsYb9++ntor2z3W/adGVE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyidtqUKXSMGA3tNd7cpHRRrkcTfTG1riHyB60X9fcEZrMOdlDA
	++eKgaQlhvKzT63D7ZICkFYcj3ZF7hqvCI7AnWjRGUP0PDl+Y8J6lg6J+rdl57ioVfjwCLsLoyb
	Q0BUtkfA+MNzvZVpxzF+Q0mmjn6as4Xp2+5tkaXdCVg==
X-Gm-Gg: ASbGncvRDKlxtSm9LuY/ryGkJVpRODJm6xIvk5uJQ40vLGmMCnQN652hBMGAO41/Bwy
	T9xJW5uNurl2kaXGfi+q71Fx0IAexeTOWzoPbKY22obz9njGDzPjZywMXNmie1ylFDFAjzcAxOK
	vmgANH3pCD73pTfWUPMEZkDanBfjl1YuboaimB4954FJGoA5fQWYewnHKWdJAjFmnWY/fq1Y2D5
	/NcVLqahr45lsoV9b6DI/FOr0H/tN2PzWHi61+nvNhLJt/6QuRD5gRUYVGx
X-Google-Smtp-Source: AGHT+IFcDL6HxDRjM9IOUsRvM6rR76FJYcYsM8X4c9fN3ly38LTHz737eOul0P1wWXKXqapOUkatEWFTswb/ZsXfT+c=
X-Received: by 2002:a05:6512:3f1d:b0:55f:6b4d:85d8 with SMTP id
 2adb3069b0e04-591d85576b4mr7264301e87.28.1761224795359; Thu, 23 Oct 2025
 06:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
In-Reply-To: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Oct 2025 15:06:24 +0200
X-Gm-Features: AS18NWCEbWHA9yKs1f5ZBEa17kPfiz81VJrrz-ESVNQ36i9Lz6DmgJHUp0v2xKg
Message-ID: <CACRpkdatXz_qcHx3yQ+6HcizdLdy1M277OqpE0ERFq04p7ZhYw@mail.gmail.com>
Subject: Re: [PATCH] gpio: loongson-64bit: Switch to dynamic allocate GPIO
 base in byte mode
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 11:04=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:

> gpiolib want to get completely rid of static gpiobase allocation, so
> switch to dynamic allocate GPIO base in byte mode, also can avoid
> warning message:
>
> [1.529974] gpio gpiochip0: Static allocation of GPIO base is deprecated,
> use dynamic allocation.
>
> Reported-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Given that you both work for Loongson and can be expected to
know what you are doing and are aware that there are no users
of the current static numberspace:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
