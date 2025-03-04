Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAB91F91F6
	for <loongarch@lists.linux.dev>; Tue,  4 Mar 2025 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077381; cv=none; b=ER+YhKGt2p7x3wxTzwgCkCpJU3ttYzODrM4BPrNsuLLQbSGfyKyvue0qxXpOB2kffqBiUDFA6Ke+FKiJrsXElg4D9bmVtxwXs8NRqjfAit0O/lbpPjm2t0PLdX4xc8B8d9NJ64KsdtHFBX9vtwBKtTcSGrPQvruWce+3XSCKPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077381; c=relaxed/simple;
	bh=9FtHf39x70lKRiD2UA/8apbncV3WIJqKGKLBjqsPYAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8RLoUORMsUhKNOJtQJ6Er2bfIblRxpqXPevp2udVsS4mH4NmTyzTKhBczuvoMoyalPVgq6eKfTOgwQg2cnABb2RTFxk5ogS5f6RAxsqxKK51EFIKMtXQ/Gowa9XxUAk2MzkYRCbyzI6B7lEupGTVkK/HhEDVvKfhVdigOnyw2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tMhfgyqy; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tMhfgyqy"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6fd5a24a8d8so26816977b3.1
        for <loongarch@lists.linux.dev>; Tue, 04 Mar 2025 00:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077379; x=1741682179; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FtHf39x70lKRiD2UA/8apbncV3WIJqKGKLBjqsPYAE=;
        b=tMhfgyqyavZSVj737eI1fXFrNuxxkrfJu1HPAGcmgpVzpErnptdJe18jNf6FQfkaSR
         Co/5lMDrRLj9J9TpBJc36IqqNHNntSGqkdQLDQVpbwuYc+4O5d1qczp0RvSdKj+WSxxa
         aTjYA125V12XAmuvxVFd3UqcbLbv34CLaOAWW2XmVQs+f3irRB3uh1pd9Pcy9yh2pAmr
         prCdfPi53qo8KbW+G3ba/fBWjzsEsuLK8Pqv2R0MrbUaccwMRTuRW6b1ey9MxhQezTXg
         YTj8lXcvu1aHeoZrSDVsfhQ1kEWZEHpTlKXETvXDflsUopib3vaR43kCmPaKFv3SDtdc
         lUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077379; x=1741682179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FtHf39x70lKRiD2UA/8apbncV3WIJqKGKLBjqsPYAE=;
        b=M+o1fEKahd0hou34n1civCOykzw793CGvFG5N0ZQvMh6eL2hAbg/ovRQA4J/vcHAZ4
         qlSQTUJMJe/Wh8wUlrb8pjjrBXMCrJ5G0y9qEpeOy4zSlQfiTg8Bamu43WxqkBQFTJF+
         48S1REgHBeHSqcbkHKxI1XdfRHMZBG+tl+QDx9oYvSQ6rrZdfBTb4ufgM51/vQOCXzRq
         0ZhUWZXFp1TwwiEHud+n1zInjZKMM8AVQ3dpQTL9i4DR6Ok3c6o0vR8CyeLXFNta72KW
         gF/zGvDC+2y4JpSQoirLYiIsiEPUTy/zOrKW5NHtlwJkkKzcHCTtlJdMcJkvGSxcFV13
         MzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp1wQzG1Fxj6EPsRNCda64G5RWIwY+0Ov6Dzc5kepnQG775rRqrzz6uM9FOrPz6ZqkQxDL8zbVGW0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpD4DBlO1FIWDJoGhmIdAbX/esY/osOrcqLO4fHS4fqewQZ/Ln
	oY8lH0pcU1RuEg9VPbXI5ZwEca4s5GNwpvhKRcsJfoCXxwMyHJB0VrQibZqHGQvZjB7RZj3s8JI
	2znUylDRxOkQ+qPcDhaPXvYuKVEe86GYHHVXQ2w==
X-Gm-Gg: ASbGnctrJCQj45x5EN8BIAU0rNjSbDeMFSdnQsdvbHFmh6l5nwmPThx/+6lZz0bY6MP
	hbYLKCLlYVy4ZMIhAW7llezcjrC0d96mJBqPAT9+q9H6huif+zpH5pJYVBSOVFEqlJrxlnbt5YZ
	mNnqdM4lpzphqsSptXQthAZhDrkw==
X-Google-Smtp-Source: AGHT+IH7KErXBPsgkVX3+USvVKOeRbWqfmwhdjHw8SbiG+Mnf6KFFaGyDDjVlc9kwM/1WPTfhMqzFN7oiRITfnPOUO0=
X-Received: by 2002:a05:690c:7305:b0:6fd:4849:62ec with SMTP id
 00721157ae682-6fd49fd1b18mr211377327b3.12.1741077379237; Tue, 04 Mar 2025
 00:36:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
In-Reply-To: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:36:06 +0100
X-Gm-Features: AQ5f1JqYjcpUf71HiV3Xuo2BjX3Q_Ei7GefWpdiAzOwYlortd9elEfLSi9brZQk
Message-ID: <CACRpkdbrOC1ONZKFetvWQACmSKYopabgpCkip1ub_14XdrP0hA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: loongson: Add new loongson gpio
 chip compatible
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

> Add the devicetree compatibles for Loongson-7A2000 and Loongson-3A6000
> gpio chip.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
