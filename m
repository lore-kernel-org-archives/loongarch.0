Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F921FBEAF
	for <loongarch@lists.linux.dev>; Tue,  4 Mar 2025 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077402; cv=none; b=XCF6UOfFya9ouwd78FoIIA9LTlMXWatRl9gozlZ9LdFYmC/6va+qZOMy7Wms/otHsAfqiNtxOIfCFi/tpjKlHHnMXvz9dBwX36mCOa9lAN8qD3Wn2LRZ51uudQ4U5RrlpK1T+jY6cBCSXQ2nyK58n0mY6zm5SaNM+p3aQ2kqM8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077402; c=relaxed/simple;
	bh=PYi+aVmBO+zhGv+v/pvUe+DSBs6vIh9tAtsRQ3oiTZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FfQ0OPZSvIKaVzlPbD1SLSg5wL0VLJt/48ryCLYyi1EuWpSErQ3V8dhHZpgGux0nTTiKAkz1eOMfxgI8AOUMEoMUsf1sfQXWDgy+nGH0nLAE+ojFqwdhpqV6w+mYwo0lBOfqZTCK8YOnte5Klq/IWBYuKSE77Q+VZddP7ociCQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vo5MIqfW; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vo5MIqfW"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6fd6f7f8df9so18424777b3.1
        for <loongarch@lists.linux.dev>; Tue, 04 Mar 2025 00:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077398; x=1741682198; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYi+aVmBO+zhGv+v/pvUe+DSBs6vIh9tAtsRQ3oiTZ8=;
        b=Vo5MIqfW7JUGN+2+H1Jy+01JghQKqnVuBUupZjvTafqEBPUYsiQTls35u6wVyHCasU
         rAiVoBoBWQ5OdQSnFxvw5i0bUhpNSeOI/okQlNjAFYRErj0rXWDIyOV5i0rX7q7S3SVj
         vDtIxmCY8FrKh0ylShLmCkf3EV3A9Jp6cYMOLnYYKZvz8pRC2Bw8M7RtSVRWBuUTxA3V
         3fh6cxVYtGTNUBdLlmqe56ka3Q8M94AcgtSZo4a05g1nGyTJw5ziFu25Nhxuh+2d+9KK
         Uczh1/nTyUyvmFGvqNHPOgL1iRybiKfqUiS0kYanb9jIbYBbL/I7+sMWtKVXDUzwlmxA
         AMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077398; x=1741682198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYi+aVmBO+zhGv+v/pvUe+DSBs6vIh9tAtsRQ3oiTZ8=;
        b=q0peeXLzwJgPp4qghwHyvfmv4HqGIhPTliiRMN1JpSRrVnsYugs1iuby6prBv6wRky
         VkA/sWpvrInXfDcKjETwrFvYTlQnKY9Q8tC2yOtnKNO3uRa9pxVmlNgWzTLteBYLd44m
         cEMylXqObVkDDmk9RJqqrWNJc7XaflNlfgjxQ8686JioLnjos/ia1MXTJe7fhhECsVL5
         jo81SPRYon7FWHwCBUveHwaz0jXgSIPWKYVDSN+hlAnTg4e1yoHVYExFLfGy/Bdwnt2r
         vpdjyq1AkQoI1MVz1pKG14z5flPdpwL5COU+2cQY1OC/hsJXIwiBAJvDZo5oh88YVINt
         jTLA==
X-Forwarded-Encrypted: i=1; AJvYcCVP3hBGZg+ytxk/XJYxYtPhOsqjy3T4KwIU93/w2Aseh3pJFoIPIi+p0bWKRSQPLMLw2+MmT4LA5Mg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNSBg887+kAGyiQpoenCuVSjHjUEF9YHlBL3PeZvLbkda0IxAV
	RK5Gk/rKKyq4OREm3bc/QSZ5c91xDtp2nY+Gq92GxAbzH778mRwdPh+6l4WE9Xg6HMZG7WfChbY
	FREs9AE9jsPKy+Ip9/2UzeaqxzSUfQ/67HbstlA==
X-Gm-Gg: ASbGncu1MRjhyL2PayjwqQIif8pJDeAsAFhJktEYurk4FvWZsjsx53LO5meTsZpL8C+
	nkfCrps9KZylrHiQ0ZCdESVbdi+AkE1qoX8slMYHVUVyXiT5inbIBAnN5fcJKhGKxYYJ/8+X0d7
	rgxzYBZS1rhXyEOH61YgEvlqZJ7w==
X-Google-Smtp-Source: AGHT+IHR2MkY/z6C2jBmZBfQewGfI+Eb8/l9yNKzCoQfpdxku3Ye0SXQO8FUr9fZFn2sj43MtQPg4KYYYIWWDusRG60=
X-Received: by 2002:a05:690c:6185:b0:6fb:904c:d9c1 with SMTP id
 00721157ae682-6fd94179d28mr27614577b3.12.1741077398395; Tue, 04 Mar 2025
 00:36:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn> <20250303074552.3335186-2-zhoubinbin@loongson.cn>
In-Reply-To: <20250303074552.3335186-2-zhoubinbin@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:36:25 +0100
X-Gm-Features: AQ5f1Jr_LhSmVKNX86GmREr8zrN54IehJSNXf5UoHh8lLJUYfrOwtfNtAAa89Y0
Message-ID: <CACRpkdage9PLDURkh5A3Zqi_BN6POva5yNdSRbf5u8p5q0qnHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: loongson-64bit: Add more gpio chip support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 8:46=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:

> The Loongson-7A2000 and Loongson-3A6000 share the same gpio chip model.
> Just add them through driver_data.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
