Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7125788B
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712128964; cv=none; b=DU8It4Ax32a2KKh/Iv1xJNbQBqzCgz/eYL5S6oGQrr4P1nkK1BfknU3iJtzglpS2QS3ndLmUvGqq4+7DJKh/fa87Q3+thjQQpyAgIxMNfje9luteBc1StpsouBvFJMVb76+ZiWc62GrzcNTXzNE35Wuxefr/Xlmm5K1hKvBV5Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712128964; c=relaxed/simple;
	bh=ckDelCKrcS824I6TwBoYPREwnSmEG2XAmq9iPVrsNXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQMJeOy3EmQOo/tHYpIVXXB2vKI037c3PUE4+TDJRjPqkcIwlUpKC257NaHihhy1oJlFQxH9hnN9oM/Lr8Sk9cf4KrpxPZfuMBzJF2P1CR+nHSRlS3lrDlS+whSguEvyD5OaSLrJHcWsG+MzRDsStL0KmM1Rij7vPgE8iSr9Zq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPquAA46; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPquAA46"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61461580403so42370237b3.2
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 00:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712128962; x=1712733762; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74psJ5ywI9NINM0wbw/pHVabtXYorhznJeykBwPE8oo=;
        b=BPquAA46SmTwYC5gPivvSah64FmKA43hP5CUckFhhKko9PcwDFtKVeimOk+jeOT2P7
         9UGUr4/jpU2xtas+2aiWfVHeiGpRrbM6fQgIdd2Wv/6/gVBJo0TYgbUOBLPv9OnHhwpx
         rt/8FHTYkObNn4CzeSsythwUrTd2fUaORyzWn4qxIYD4MhTjCZQUHvLmAE1g9Sg0O9Y9
         Z2OYGwvx7AvwKH6eXPhNl8jxFsgsMZVZ6xp8L9FLdBTKBlsVVgvN7Re5A6LDrZf3zBp9
         ozs2FAH3Fr231DHpjfvyzGP1bTID9eRIhRB94mkBL5J3Ie/e5swsEZjq0b9uycPnIYG7
         bb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712128962; x=1712733762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74psJ5ywI9NINM0wbw/pHVabtXYorhznJeykBwPE8oo=;
        b=cb5P4Db/iwn1o7IrB2TKOjFp73nDKKnJxoiR76qhkdHC+CizaCYvl2FEmjr2dyjX0c
         oe+nyKgJuX790CI9UUV+W78WlLMIpDS5ZOPmCX4GCAmL5TG1t5itQYoxb39RnAN+IBsA
         Su4FWApYNGuKfLw7zuqDauz4Lvy3QvyATvlIw61BOXeGuHecoa1+HdHimq+Z/HY7bh0W
         9N476yWnDwrbU9YVgS8oIDr0H8PAdZmSGmyM40zMQNScjKWsvxc3+1e+gdgWcNffNBbI
         bXRrFBFBRQZnvNOcyFa22lQkUuzpKM7S4tgfcpeZ0e/NylvmRqFK97iiE189imYA/DVt
         RCQA==
X-Forwarded-Encrypted: i=1; AJvYcCUg1mGAvOXaQjJgwLBL9bhgbWpw4aPUfxvMpBcHJuPcj/QNMnAZqMfO9aryFnOWZ6hVvSfPRnCWA8E7MEM/HN2ivW4/u3wzS8pa
X-Gm-Message-State: AOJu0Yy/ZtbHfk2V506fFPU9pBz0K3ZjGnzYhA43Mv2JMMTMWAEPCb9q
	iUCcuOleYkIEsmWi2oqNZr3KeQIVmjIoEDPfMuLQvgqsmpOsROjPfdVGrh2Xi+JMQICSBv7oaE3
	BqSRCcRo6VhCHVa94AlZpPF4A6ik=
X-Google-Smtp-Source: AGHT+IFiYm6/3//pbivCiacIiXyrTXVy+5Q2Y9k+w+VbqHhlit69Rd0mSnb9ARnxgK1oHVS+FySZphf5EjdpNdZYs4w=
X-Received: by 2002:a81:4f4c:0:b0:615:59c5:bf03 with SMTP id
 d73-20020a814f4c000000b0061559c5bf03mr1209815ywb.4.1712128962368; Wed, 03 Apr
 2024 00:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1711953223.git.zhoubinbin@loongson.cn> <edad2bb5b0045c633734c1499fb163c3c6776121.1711953223.git.zhoubinbin@loongson.cn>
 <20240402174051.GA324804-robh@kernel.org> <CAMpQs4K_VSqdm7x=cSyMTBYQyOm=th0YrYKdZ74dp35hyRBXgQ@mail.gmail.com>
 <d0769eb1-984b-4e2c-8d9f-818113d8afb2@linaro.org>
In-Reply-To: <d0769eb1-984b-4e2c-8d9f-818113d8afb2@linaro.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 3 Apr 2024 13:22:30 +0600
Message-ID: <CAMpQs4JrVJ4rOE+XvMQ51qrV3gP-EgcmZdK9J_a_xvEia3Y4vA@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: pwm: Add Loongson PWM controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 1:00=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/04/2024 04:37, Binbin Zhou wrote:
> > Hi Rob:
> >
> > Thanks for your reply.
> >
> > On Tue, Apr 2, 2024 at 11:40=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> >>
> >> On Tue, Apr 02, 2024 at 03:58:38PM +0800, Binbin Zhou wrote:
> >>> Add Loongson PWM controller binding with DT schema format using
> >>> json-schema.
> >>>
> >>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >>> ---
> >>>  .../devicetree/bindings/pwm/pwm-loongson.yaml | 64 +++++++++++++++++=
++
> >>
> >> Filename should match compatible.
> >
> > Emm... How about renaming it as loongson, pwm.yaml?
>
> Use the fallback, so loongson,ls7a-pwm.yaml

Ok, I got it.

Thanks.
Binbin
>
> Best regards,
> Krzysztof
>
