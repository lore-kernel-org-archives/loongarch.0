Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BAC1CEAC3
	for <loongarch@lists.linux.dev>; Wed, 19 Feb 2025 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739956327; cv=none; b=OBSk5F2tkGNxBYs0qhkbncWAttiAvpnsvjaCXK8cCuo6dsma7IgxBK5f3UYQhhYGKONEMRvbEzaruAiKlXa+XRB3TEwGoqD0EIRWQm3g3ArKUuI6qd+gLlq6uluIzFONrqsndtLWTwWcBWsUDu5nJJDh+leTQ6JmQd2CLhaqH8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739956327; c=relaxed/simple;
	bh=1mDmGlQiTjrTM9JA4bPSMWae34JasEkJOVEndkM6ZvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6ZdOA9oKFUcGzhUMff7LHnEqGw7ggtjsQoi/t/cprjsDZb6paSHKySlJLRKI/gLqewmnfS797OMA5y95kej7yL6ClOAl8oI+C7+B8JfKaT5oBw0K8NsKMEfoG50HAbHpXGFv5IuaurssBdPlWNzo6y6pnAxUtSoLPfoyXX70lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GH3va7rf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH3va7rf"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abbda4349e9so49113066b.0
        for <loongarch@lists.linux.dev>; Wed, 19 Feb 2025 01:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739956323; x=1740561123; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBlQIQZTyl+c9YJhOesoDPaG6Lk+JATvxoUqF2ZkP5g=;
        b=GH3va7rfpXb3S99ksa/GIcXHI7lg83QEg4dOHGjDZHSG8L/nLSZg6qsnaMvEFX9rSk
         +XH91zdRakin8USLez25yKGWNN42QfkUivT24twY1UPkSiaOBO4CN63+6x8LKRZ090GL
         TZEH7IxHdtMyt/04npow2a5Bd44ySMcm+QANux0kMWPrzEHVVou7OwnZSTicM16/YBqJ
         BIYtDuQMC+74jCTLWIjNThs79YN0HJVaAmIFlpDOimr1DYd+yWIC3PhEO6WaislorhH0
         5SD4iJ4m9jiCiem/WBP33IJCF/yApOBdrhxDxbkuz7sLp4VnxSgfICe2N/yg+zfe9t2n
         kHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956323; x=1740561123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBlQIQZTyl+c9YJhOesoDPaG6Lk+JATvxoUqF2ZkP5g=;
        b=Hmjk39IanNOQu70ySjJs14LNJaTLcT3xu/k3waHyy/Z3YRx6u1z6F1Uj3Lgyw3EPMj
         YgbzT9HsPwUuq7UJcB2V+XnMxHrtbgIgCgNZB5nc+QOhBsbGVAQt8N8bswpD6DXXtba8
         GgZmh+Df8usUuRLmpLsDvJljaXxMoiKOuYo6kdcKeV8u1+iNddwxRmAYBlMz10xdic+k
         AI0WZZkbbi9EnLAU23ymrwgiN11z9fzZ1u55Rm6tRGeeCBEa50LUA29SEuBCtVCEYUVh
         b6q6k5dClmw4XBH7CrXjKLQwsR1Qxy/ahYZDElBNHpey/O1FqFpMwD0gAbXGG4TzUTC4
         BzaA==
X-Forwarded-Encrypted: i=1; AJvYcCVOyIofa3xNva8GPXX78PvlkNPJ/haRHfd0jOEoJG6JRmYy0cWcvtKOB7q2QXygJnukDQBQhln+jQM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/w8/v3o08pqULyKbMvmGmzX830PzVYIPQB9Psxp7ULe5NbxCW
	yQZkKoaphwHoCYkF3Cr8K6hU3aucLywjw4R3cq23jPA5HvIBzsvKUN6jzES8BndEz2MYCV9K+hf
	5bWwBCx52HpMiNVUgnc88nZQVdj4=
X-Gm-Gg: ASbGnctQFuWgcYVUe0LeeDF9TC1cuMLkxxUHLM3ufesG3E6orIny0jMQcotofoGwF7m
	NKJioCoqAlR3tOtw+S8oxmFSeXswou79TVCCN/ffE5o+MWJMRtpbjjYQK1QbdIDupjnLWgGAn
X-Google-Smtp-Source: AGHT+IGuIK/CQy8bOdyilmjVVAnjbdAlGWgVtHcOdZyL7b2VSZoGr3Oqwi/oJeLhkyY9/0jyPhsCU2sPtKBUq41RyoM=
X-Received: by 2002:a17:907:7fac:b0:ab7:cc00:4d4a with SMTP id
 a640c23a62f3a-abb70d95cb3mr1810038166b.35.1739956323370; Wed, 19 Feb 2025
 01:12:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250219020809.3568972-1-zhoubinbin@loongson.cn>
In-Reply-To: <20250219020809.3568972-1-zhoubinbin@loongson.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Feb 2025 11:11:26 +0200
X-Gm-Features: AWEUYZndSh3zP-0TVudcjduNMhtOO5FnyJN-FotaI3FwFJihJXCAoNLkXbk2NmE
Message-ID: <CAHp75VdSqFhEp_Xt=qtBNDDz984N97pZmS684oS137dFi0o_pw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: ls2x: Fix frequency division register access
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	stable@vger.kernel.org, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 4:08=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> According to the chip manual, the I2C register access type of
> Loongson-2K2000/LS7A is "B", so we can only access registers in byte
> form (readb/writeb).

readb()/writeb()

>
> Although Loongson-2K0500/Loongson-2K1000 do not have similar
> constraints, register accesses in byte form also behave correctly.
>
> Also, in hardware, the frequency division registers are defined as two
> separate registers (high 8-bit and low 8-bit), so we just access them
> directly as bytes.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

> +       /*
> +        * According to the chip manual, we can only access the registers=
 as bytes,
> +        * otherwise the high bits will be truncated.
> +        * So set the I2C frequency with a sequential writeb instead of w=
ritew.

writeb()
writew()

> +        */

--=20
With Best Regards,
Andy Shevchenko
