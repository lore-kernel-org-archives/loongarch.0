Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F34618E28
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 01:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711502157; cv=none; b=UU7vhLC08LyQrCX0iQRdQXI9hbMhheKaQeKOskhvhINJniPsuKFU5Tjnks94t5s4dCez5uORqhrSJd00lMcPQdGw3oV7IQ+EIf2ueulaiBNkMgDnFsCbdLgb5Uo4kMwZoqMZaZIGHhjboJryZtOSVZOk2i7Se3sKTL7qaLR3uJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711502157; c=relaxed/simple;
	bh=PLidVJaE//HxRhz5H/QzI3/xtp56vRobIOOw6V0NeqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvScATrg0eU4Vlgk05Fn6ZtDfFdqVHl9qVaJNAUeBtIT8KFRe/nVxwZjGZSP47jH9hwi1bZWxH/qxLMqtNnUUr+mlYxsbk91AAb2PNPzG8uZQQ2MYLInHZ6Q2oWJcDClHDkqGMWaacB+EDyx2h14k4cdQgQ6Lm8ZnUWDqyFNTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLoVAcID; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLoVAcID"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d4a901e284so116607561fa.1
        for <loongarch@lists.linux.dev>; Tue, 26 Mar 2024 18:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711502155; x=1712106955; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OHmV4irZFRN7yhkxXILCmLuBOPWKdOt3kQNZKrG9Qo=;
        b=PLoVAcIDOJcRvpPS3/IptpXM8rL2NYdWX11bVVF7vEFoMXBsk9l8MWc0svQVJHwiIe
         UDGtXRNCnm3n2j3QnXGtZPltpHm6TcCzJlXk2JIbBcbhzkB4TKvYP7tiY1C9SVH2Kf0y
         Ma9nE6x4YXzi32h/3nMEsseqbBxxVy7mVXfTXpcMI5/UFoCF72Pt1j+IJyKBiQ9ChVUa
         T+shd40Ow2IhhoB0aMGS2ZTTd6O4lrVo+OQ8f+gZaOZ0yuhqXs6WsXORtiwVottAzhCK
         3xyaBKO+XBUjlKWiMOA9XfmQvDb3/Y0Gkn+OuLsClRIz6bLX6YdnW3lk1q9t2k8Tb0Ij
         3ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711502155; x=1712106955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OHmV4irZFRN7yhkxXILCmLuBOPWKdOt3kQNZKrG9Qo=;
        b=kz6CTBWWBCGdKGrTe6kmvns+0zLGiNM4CyQpy8DuyTxtXAvcdYsMufWmpDNSeTHQ1e
         FI4gTp0m5Gfv+my3Lm5aiIyqSgFhMskZ20qg035fvQUOhCBlakT9euBBvBU8A+JrnxZ7
         IgYgzTO/GRghfIZMSntTCA4H5VvODEI9AgJ6MR/pRvpz9MmzFtCk8x5pK+8GgeDRKac8
         x06e5STTXI4JULbZ1cUReZHCzyuJ0Lz6swb5NjrnyUYQJUOSeTROiVXajO6oS6RzLFTF
         rbnOCXc/1P9zGBwbu3bE2ndV/KW17syqbfwnfEX1EccE2gn9WKxfCKW2+L75pwah6Mqu
         rO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFoc+SqijLAxMaeY9J73YIhjhMwo83vaFZLQ5OqgrGDFIpoA1EKR5V3nBWMxDplXLoMFPHtx+vPgeJZxtu8bz4BUq56yPph1b7
X-Gm-Message-State: AOJu0YwnHrAXPbeFTMrYEI0BYr0SQ+CdFbx6a0L/xt6ZiimUlDHxbW31
	zlcOFrgnAVmao6m8WxGGM6C8HDLBTuOYqhq8dOwLdr/IXrfLb2fLa4i9WPPrYCI3lsbANOfFIAu
	3uu30MglARtF6tq8CTvlOa1/CsSs=
X-Google-Smtp-Source: AGHT+IE6oY27Hvh1xBoRmMHbRBXrUqGabIUdZcpUuNN/8gTJHCNOgWIrkAnYswBuXrHRGBvH38Mqs7Kj5XNZBc+eiQw=
X-Received: by 2002:a05:651c:10b9:b0:2d6:f408:fafe with SMTP id
 k25-20020a05651c10b900b002d6f408fafemr984912ljn.42.1711502154359; Tue, 26 Mar
 2024 18:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1710926402.git.zhoubinbin@loongson.cn> <0cfd237c2c7c1e4f89b6e5f7af0a64d306de1c8f.1710926402.git.zhoubinbin@loongson.cn>
 <20240326-shifter-zeppelin-1d8616dc82f9@spud>
In-Reply-To: <20240326-shifter-zeppelin-1d8616dc82f9@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 27 Mar 2024 07:15:40 +0600
Message-ID: <CAMpQs4JKYxJQ=+iRW6EqRc4t3wF=eNLVg0Y=943D+X+LmJyG=Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: clock: add Loongson-2K expand clock index
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 12:54=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Mar 26, 2024 at 05:01:00PM +0800, Binbin Zhou wrote:
>
> > -#define LOONGSON2_CLK_END                            18
>
>
> > +#define LOONGSON2_CLK_END    35
>
> Please just delete this. If you can change it, it is not a binding.
> Just define it in the driver if it is needed there.

Hi Conor:

Ok, I will drop it in the next version.

Thanks.
Binbin
>
> Thanks,
> Conor.
