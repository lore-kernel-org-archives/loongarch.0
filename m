Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42243FE4
	for <loongarch@lists.linux.dev>; Fri, 17 Nov 2023 09:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzoPylfn"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-da041ffef81so1822833276.0
        for <loongarch@lists.linux.dev>; Fri, 17 Nov 2023 01:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700211960; x=1700816760; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrD8+qkSJjr9Q+fiMn2ZGucWuBAaYvxiKOqNR6fU0Tg=;
        b=hzoPylfnJEnAiiicRapc1NJe/mWfLh9p2b4Pmn2WVzCKU16/bIoG5Kesg6A4iHkjaE
         +fTHt877PKz/upqTNxfpAjPKL/EOFn5FmqKHBIRhg3eZGC3v3BZ9T5W2/aLvDboHUyRD
         DPoQplXziSqhkwDOD1iyt5F3wYLwYMyY6t7HuNSIZZU0Lkrzdt/GaLdpQCcUoiypfAxX
         HsC8EwkS9SMnXHaVULX9PMcrntUEtj73txfC+n4OdGN/MBeOGCtlwOSXxG0+KE9Q9Ixt
         HjdBU6U1qJtAIwypFXw026aCfkeJijTX2NOAL9UZFPvDVrVWO6F+pMKvclHul2gCAFo5
         k0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211960; x=1700816760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrD8+qkSJjr9Q+fiMn2ZGucWuBAaYvxiKOqNR6fU0Tg=;
        b=soV8tPoJ4UFYwDEaeRzzj6CTVdP5JMTjjaSMNQhIRa9oAwu0DU1IJpH9ZzVD4c/O3v
         mwpbdFWRYOenAW4+tB6d6AxMe2sg1qedWEMb6vxsyhhEaXvkVeSe2+kkTtzIOadaEJTj
         vepFGc/Y22OxDtmN74lH/hR6ZtFtFZttepx0oyYrEdiZeGye0HPulHvKMDhWDVZdvudm
         Q2f3dg/xgkIAh7RzgEIei/VmaMyukbxVSOOeQfrbpaqyGlvGN+4mdm19moygPrbVijEY
         1ihuZ7RI7tg96VRSzQ2xRPVG3y8YLAq1+9d1Ledp2yQ5V8tIf19HH6jETkeCgoPuYbGs
         G67w==
X-Gm-Message-State: AOJu0YxKT3mgi/FcamXFYIPh4RlXylv2skgpxHAVXtI46xGWbzfnB7Em
	xDCHRuIIK2SJo+A371gMiDtwfUqfWIKsddpas5Q=
X-Google-Smtp-Source: AGHT+IEPixzhGpSc3tEVO8ZRFesnGrSzYBPawj/qAai8ntLRg9Ayp0XOI/51MrxatMcMZiHLvSJYqxEGgMe7A1fzuaU=
X-Received: by 2002:a25:6ad7:0:b0:d9b:4bfd:b75 with SMTP id
 f206-20020a256ad7000000b00d9b4bfd0b75mr15683441ybc.18.1700211960566; Fri, 17
 Nov 2023 01:06:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1699521866.git.zhoubinbin@loongson.cn> <84cb3df17eee993fc6a10e965b3f438f9034d2de.1699521866.git.zhoubinbin@loongson.cn>
 <20231116173907.GA2446677-robh@kernel.org>
In-Reply-To: <20231116173907.GA2446677-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 17 Nov 2023 15:05:49 +0600
Message-ID: <CAMpQs4KkOS1Eo-Y7=D2kP+yOW78zVN_7WDO_w0mc5-uaBGT47w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: interrupt-controller:
 loongson,liointc: Standardize the naming of 'loongson,parent-int-map'
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, lvjianmin@loongson.cn, 
	WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 11:39=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Nov 13, 2023 at 10:36:21AM +0800, Binbin Zhou wrote:
> > Since the 'loongson,parent_int_map' attribute naming is non-standard, w=
e
> > should use 'loongson,parent-int-map' instead.
> > Also, 'loongson,parent_int_map' will be marked as deprecated.
>
> Again, as I said last time, it is not worth adding
> 'loongson,parent-int-map' and having to support both forms in the kernel
> forever. If you can define a time that we keep 'loongson,parent_int_map'
> that's less than "forever", then may be it would be worth changing.
>
> To put this another way, using '-' instead of '_' is for *new* bindings,
> not existing users.
>
OK, I see, and I will fix it in the next version.

Thanks.
Binbin

> Rob
