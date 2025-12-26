Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BB9347C6
	for <loongarch@lists.linux.dev>; Fri, 26 Dec 2025 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766743445; cv=none; b=O6+DA1S7nr1LM56gLMUVrZVdR+lgWWcPwN0GzeXwNk6PIiLGx1vLoPkWnFJ1qcYTYn+NdLEFUyIfcZMEJzy5brF3prtxWlvueWmvm4CLXkSZN6iQkbRR9ioDSJaC89BypuuKlynscFyFxuU0dps/ae0fCWIHq3iU/7VT55gaYN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766743445; c=relaxed/simple;
	bh=bsPlTRK85fjjyDDqOcgY783Uyn44b4lPb1UUHMFZ/co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvGR1GYl7NWvY5qod4FJ/7RbR7jn9URYhetqK4uLRX78koaWiXf0Oe1drALWqWd+Ijoek2DYT3d4MgHw+32VXBwoce4nFV2ujaISVq352hx++bApPWkJDwdexDOnGjMYNo3kKrWygvgwzd9xbudA+rD1rVGKWdhmUL0DTbWdNMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mq0KB+YS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mq0KB+YS"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59584301f0cso7759592e87.0
        for <loongarch@lists.linux.dev>; Fri, 26 Dec 2025 02:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766743441; x=1767348241; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c56xVey+/P0K5DvPpIeRFr1NM6R9NaOEhrxube/Xe6M=;
        b=mq0KB+YSOq9/v54lt4HS0Jf1qIeUjWNZQnT81wopFeeggo21Cv+ETPfoxlTwTn002v
         pBmXpPKAKWAtXoszku3TaG2CyVwb1dIaZETD+34w9YraWdsiMOscuivGGbkbLwfdZu1M
         31TJSSg9xD4I9I/GAr1mBya2BacwJDDCFc3MBdxEwC8qjmFq8MXYqfaNaTauFpPSRkzT
         uGF1dmypbOQTApfjk70S5yr1zp7JSakoDWa+3P7LtYXCxTV9aRF73m/56zDoqzR1iCuS
         sOp4e6WdGWwH8KdXkg2WfRi3hocNPmjpwCr/zQYfXvSLbYFVqJp0xTuTFK+TFCAxJmCR
         zW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766743441; x=1767348241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c56xVey+/P0K5DvPpIeRFr1NM6R9NaOEhrxube/Xe6M=;
        b=Vns7dfoJIV58GGtDGj053G0O7CSnOs3BfMoz4o3jxG5MSGx+axpbYfmEL1tqBoyYHB
         HAFQVbxmrLPA9MLnhq3P6AmbLajFY8C5eA1WJuAuAsJTQ3gZEQt8wq9fNP8SyA2BaQ4b
         cXh2svWlvlSo2HExsX7FawT7+kcp7vfSJLgKZzfaeR+n4xmRTeI7klxSHR7MRPsqADy9
         p8TX3e9V1yS9sk0A4KhMyK1r9ixrX9sSSQhAR7pGeo7OCeLzWnz3xMC+lXEbMceqMvzy
         mzo4Xf6BoOXF+8pdjNK7pQ1tzh5FhCrBXoLxuRt7jTVPFqjzbqgFIIDtQtk6A7gzT/L2
         m1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVnjpxSZLtGl0N2R8ks6hyDvrB4xcADkw3Kqf7KOqfLcsW3nOoN9kMzCW0ln/qbiGuiw5bFLcsXM+Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7J6VP0SjO4m8zdQ4Jlmz1mgJxevAyxabCAGDxty/7LOEQ2+cu
	BV0jv0T08Fe/EQRSD4//JyHA9DCsLRe/ng/7x82MqytziFOGTA2YU8rzOwEhwMZWGlOHo6axnu7
	dku5f/VdfvdRPDy7ms3i55AbFx7ECZ1A=
X-Gm-Gg: AY/fxX4CXArSnpQnfXLEqG6Bp+hVHBCg2CLDJiQme/n1RXTj2zONOMD0i7dIIGPPFox
	XVkrH+hZcatl31W3sVa7SzcInbBS4dA34YcA+AjpK+iwLJ5z0GQ4PG7haC1s/tXHK54y8Or4Um6
	o7rYpDoJnbeCbaxdTca4ejwD5uGuEyQYoFaWDD+lpOtpH3tSzTZ9X9LB0IrrA36o8xZRz7da80R
	dfta0TGVRAsp0nzxWNZD/yo0RkT/Af8jazSIhnVEX3ObMkeApmwb0SLGWmfiX4oPm1aGOIV+6J3
	6uesSWQ=
X-Google-Smtp-Source: AGHT+IEeJtzsXB++6IhxWCem8I/iqi6tN+vUyXQQj7sGJYC2SPWAV++ictVP2fCKp10Wj5G66giWAcJxanY8UYAXGPk=
X-Received: by 2002:a05:6512:e9a:b0:595:81c1:c57 with SMTP id
 2adb3069b0e04-59a17d1813emr7434587e87.11.1766743441289; Fri, 26 Dec 2025
 02:04:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1766471839.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1766471839.git.zhoubinbin@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Fri, 26 Dec 2025 18:03:24 +0800
X-Gm-Features: AQt7F2qiUK1mpU25DWjs_X4oGOorQ76rYhxJTsfWZSC-loYSKF2H28Cd9YxqJXs
Message-ID: <CAJhJPsVMsWmiaghsyvfwGzBOoKR0Tn9gGwaT+tpeW7q+qfZN3A@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RTC: Add Loongson-2K0300 support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series:

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Tue, Dec 23, 2025 at 2:42=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Hi all:
>
> This patch set introduces the Loongson-2K0300 RTC, which has a similar
> hardware design to the Loongson-1B, but without the alarm feature.
>
> To Keguang:
> Would you have time to test the driver on a Loongson-1?
>
> Thanks.
> Binbin
>
> Binbin Zhou (2):
>   dt-binding: rtc: loongson: Document Loongson-2K0300 compatible
>   rtc: loongson: Add Loongson-2K0300 support
>
>  .../devicetree/bindings/rtc/loongson,rtc.yaml | 13 ++++
>  drivers/rtc/rtc-loongson.c                    | 65 +++++++++++++------
>  2 files changed, 57 insertions(+), 21 deletions(-)
>
>
> base-commit: 16bd954c93360145bc77cc601e350913fc28182d
> --
> 2.47.3
>


--=20
Best regards,

Keguang Zhang
