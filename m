Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565041FE46B
	for <loongarch@lists.linux.dev>; Wed,  5 Mar 2025 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741165005; cv=none; b=TnGS+ldyqVpVNW/o1PFKmc0IEltwu5Q7zbvntlhbtLgtmlaBmM6aZfDbyOee1d4bsxhwfFsj+8F35b6Xk2Y3DjkLbL6VdMAszUk4l3ubDHDMX6/8apbLpMqfWSH8R4PFkQ6IRnfNhLtECKOafc/vdB6ePUFWb0KuDFTE/RSdbJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741165005; c=relaxed/simple;
	bh=MdB85ZcPm8v/V2YtsHgVtSYH4zfMxt4J5oHF0yYVGyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mvh0grBz0bkuLnCewoI5axkR8wFlFq7xT4SudD46QzzU9/wIanJCyM9MqgGA5/T4LhK7OezYpwuwgZgBGF0zGWbVRlFC+NHvTUfHhFYkv9OmbdllSIFn2Zp8GDmTzUvNa4lEMEmI2o7Ero84BCqHklW3C+10yr+uyDekjbgO1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RrDR/o/k; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RrDR/o/k"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43bc4b16135so18261715e9.1
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 00:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741165001; x=1741769801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Fuv0TDvt2J50qLsgdzrl3qC7n/blSVSUBhsKPFPU+Y=;
        b=RrDR/o/ktQUbXwXaeNWdH2KHYrem+4/1g/sk/+NfgMAWGOfXW8MRyKmXnA7TxtLC9b
         77blRtlB+5KyAwD+2V1hWgABbXmwSTU9wD/RdhOA9U7cW57j1U9+WKJxQs5xQvpVs7vu
         Gyn3JwY4ndLinEh4tbq5Biickol/puUe+KFt0v3LYYFp1bYu4GEVtil6AhZFr/nnAhYD
         +RWYK4GNxIVSZboFXfDT9me1RWeSirjfVuk4dTTKe44BJ1x3oCSI5Dny5efQsMOrTcVE
         g0b0bZXZ9yBL7kFEW6X9VT+Z8geaupoa0/LCK+Hv/gY2ykzp8cBcijO6TslXBffBBCu7
         ovqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165001; x=1741769801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Fuv0TDvt2J50qLsgdzrl3qC7n/blSVSUBhsKPFPU+Y=;
        b=NwLE/ks8I+ak/qm3wCbvmg8J+asxZGmQFFotqFSDHaiDZWjJOwrODVQ0Tuzi7MvHhA
         EnDMQJxMOC2JGyqJ+FZxfqsH2ZnDvbfPsaRPe3smEeVt0gODCwv3O4ZNnTCK8D4N9Fo5
         ahjHUcfSEHGa/O/V4KwBXjJvyxGJx57httXKAU+NdmzT5T6jt9OiWKvwZtmUy+qba9sP
         TKZjhaD1cPm5mbfooGSD0OYUkecdvGtlTRYusP37A0Ox3vFJEL47rC3NJ+uDb1FufLbF
         kCn7bW+LTgobQgUYTlsUTxvs2N+t9dFK9vcV6BaNj50LSIP56oGvM/j85/UuOoTwlPFq
         REwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNRAaUS40aR6FeWFQuhE5MzbOiwyRKmCVBoDNi1qN10RyiPIdJZ2AFcVellO2JsIEex2XWXmoMiKY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvlrj3hSCoa+WWIhZVkBN6xTUvVVJyUb8ALcoX1eoDkW4CmkMG
	E9psUMk6ibeKiyD1cRJUegHv4npsyeybpPVe+QPb25OP7n0Xq6u0h2t7WvGmIk8=
X-Gm-Gg: ASbGncsQF9NTbzg1Zww4OkNdYb00r+RaOkuQ9qbrD5g9G48jLcavJJ5Gz5aMZzF/a8k
	CHBkOF7lm0HKVYmGzOzkdK9mkoPFwTqxtidcY/Jvqou/T57nuaGlnJmqNp0WrGl0axQ7gbobxLA
	hrhntqe3/EfnoRqoOYw/kbMcbkbBRdajXz24p+xeXHssbP8/0ax87u5ZbwWDM1R+rtzZgkSQqyo
	K3k24j30NvbezzwLqyiVxtf7ysowWfxlkTTtiPybsyAmC4Bmp3zkPou7olw75WQiB0LjzMDrugH
	ZAH6WOvxzF7Du37E70W30ytpE0iXujqjtkLyGsw2yaA6
X-Google-Smtp-Source: AGHT+IEjTeOshg/et4xsAiyT8rCEdbinKDlmt5E8tVs9hXKleiSIZhgrtg7jQiHngwX96hNKwI634A==
X-Received: by 2002:a05:600c:1988:b0:439:9377:fa21 with SMTP id 5b1f17b1804b1-43bd2aed6c2mr12768215e9.19.1741165001227;
        Wed, 05 Mar 2025 00:56:41 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e514:53b3:5af8:e408])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796084sm20652588f8f.19.2025.03.05.00.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:56:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: loongson: Add new loongson gpio chip compatible
Date: Wed,  5 Mar 2025 09:56:39 +0100
Message-ID: <174116499292.21788.16321684566048827154.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Mar 2025 15:45:51 +0800, Binbin Zhou wrote:
> Add the devicetree compatibles for Loongson-7A2000 and Loongson-3A6000
> gpio chip.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: loongson: Add new loongson gpio chip compatible
      commit: e4a345c55e1b9b5ab5212a93b081f666f71b303b
[2/2] gpio: loongson-64bit: Add more gpio chip support
      commit: 44fe79020b91a1a8620e44d4f361b389e8fc552f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
