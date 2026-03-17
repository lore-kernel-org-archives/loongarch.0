Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED143A8725
	for <loongarch@lists.linux.dev>; Tue, 17 Mar 2026 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750657; cv=pass; b=OcZ50ltTM+yVGVkdKZzTzP6ERrXzGGFYGZkRKiD+KmIlXgkTwpyvEzfHQnD9HVk8cH0uA8619QT4FG/Wcyo6UO+IIDu03ohmY4tgaTmmCO7eGnQvtnnAnsCHAQlWRHQA+aMTzEfVB8E42V+A5uZslqRXGrlR0sFhr49xUHqFgf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750657; c=relaxed/simple;
	bh=iVI/aYbZjML/zXQFyx/DyAycVJiYb1PkAlg427mPHcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qP10I8Pm3SWo9XbBAfFYh++3a6NSQP5cpfw0Zf8a+OKQ9IV1VDSu4oA41wd/hB1jY9gJ04thN9dcbT/tWz0KDFzlE/Lh1eA3SH7ijPBj8Nljv17q7yy4aBzWgzM+IiA/l+RPvl55CKg5ord65cnu2My5EFiVIssNV6nDSpVB9/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNNGrY18; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNNGrY18"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6652452d94aso4249045a12.3
        for <loongarch@lists.linux.dev>; Tue, 17 Mar 2026 05:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773750655; cv=none;
        d=google.com; s=arc-20240605;
        b=VBiDiJ8kr9IWhFXL0M3poi/tuvAyIXt5E0MFI/gTYqBpcIY4WKRLDC55FU+1TpuFfR
         G4jbZJ0Tt4wLB98odMEwj+dLCXbJ9C29fPO4t3dwxeIjEuVu6KzovjmrpWkj7vzdb1XJ
         lVUKY60jZf3nIqZW/G5WN64ryVuK/Pc+k4AIDjjHJnQ6QDiLvZPqfHtt7lnv0QM/fvYn
         9mw1UhxVE3NRpXiQcZ7Xy2WCBFtOMiOpXH+91qZLecls7ewJ/1Snb8M7FvwZW1X1hMu8
         unKBd/evDDpv5mpc3lIYN03oTIcartHpUvahbnTLkl9E3JsrbiJRB2RNFbo8TXR7awm4
         I+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eKGVaZGEthLonpWdZqAUAIX4b+v5oagSeyJWvMOko08=;
        fh=sb24EGDy3Nl1QZwv2GJuTlcCvJPSaMtcEbL+UFg4Nq0=;
        b=CoWJ9YKjMBLZjgf0VJxA4vdNcUvBtXwJKyD+2KcIg9eviFCnWeILKN3LdMCCv8/hJq
         Hd/dhUh9wzl3E2QbkWVYfptstZFc7cmDNcEk52tVci0wBmv+jCnEF3kQxAl0+ph7Onjm
         ffJnzdfGnbvni1eMiU2KKfZ/pBMGl/T8sHSMy805I7h+t7zU82Mh2bY0S1EmyEqxXw++
         2g8zcar0ExbUhrlqqMbHPo0vCA1xHnk8LzmRIpdy0PnmPHtO3dog7gOyq6crrwlwkA73
         eAz+1zccxqXiSKC2oVFy2gcWNuvTjzF0Q+NgTd9HPtpvG9GYxj8N+l5cce+7zMx8MHKU
         BQBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773750655; x=1774355455; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKGVaZGEthLonpWdZqAUAIX4b+v5oagSeyJWvMOko08=;
        b=WNNGrY18C2qXZPUnBdNKyFXKTscFn2SHpQmRXwaLWAKurqAb7HXzyKVugV3he/BoHR
         aCUtiM9KKJlDRcO7pQQjp5FS+IJ9E3fC52s+p0NoCdQvc8a1FVr0mRRMD1Wdkx9klgRB
         AeDyi55BjE3B+ldtGtPFyBukw9GR+fWgvR2Y2hj2oY3SOlQU3mjk9YXbXjcQhXQKdqT2
         tWtIoEjILDmfhZXMpf8xQ7Tw2G7mMvL6/gALLI4zWjP7fMKAXcfoHTS2kguawSE80Ry7
         5El2d5s6+7J98+U1B2hDN7UWrAsnZKgIkcYKDJY/GjF3Bs8I5QEqaTvTS45oj2ezZXVi
         8ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750655; x=1774355455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eKGVaZGEthLonpWdZqAUAIX4b+v5oagSeyJWvMOko08=;
        b=ccxnnPeD+TVaFTysBYQtNrljF6tpelb0/NmiBh3zy07D0rPVbWR08bT3pHBKsBIFVp
         U7L6ZQZ5i5v1QnChUQJC8Nz5yso88iUC60qcn8UXFpfeTl62t+d1ze7+gBaFdT518i+0
         AbVz6pMfS1kbgvFccGoALl7cBqHnzhBClefzf/iLG2+B7UEXMVeas7OTKEBVOX3m5iKi
         GSFklEZnB9cKjl7CyAtpAPka7eAe/I7/RiTMKQhVaRysRiQvepy3lUURx5tZESjqiqAi
         Dcg5QUEViPSb+IUqfgSBPyVsjG5jTMB69obmeoH79Opcu4qC0+xaVTZ3MLwE25Luy/Jw
         K91Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlL4EX7FbyTR6MwEFgACZjfVqrwItVNDqQ3lE9rqwMCzHRosFe93N1L9Ku/43F1DM06caaAVMQs8g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdxbCoOjtbGODo6x6pDCTs5YwbkbmZ3AFl3A0YqfhvswcmmR3T
	43kl7DA1+7X788+kfeg8Tod+W/+IZyDR8fF4CTjE5Xi0yo+lMjKE5lfBRFuNFUEZW2aaLdD16WI
	/SB7QXde6LSDivg5lUlQhT05l/CZ/veM=
X-Gm-Gg: ATEYQzwU319CAxyHNBrBpSi9BThxYpqvi96fZAIc1NLunrQG/yD3ELTk60PlDhLhveJ
	e4zO7zh+11pP8H1fAk5lB5cIbkPWUIBD1UhcGIXv6mnh0FU56Wkg+Qqv+cROPUa+xXFXW5Cfy9j
	pw3eY+Yj9oDHm3VPpjEKPZXmAc6qSsGg3hPqCpaX/Pvt2wsgLg/SrsdebNGG7jRT/TXLCx3TLT0
	AxkrxqBoX03fKMpoN+dkhlhx0DMW22r+E8mJBPVFPs5cXc7rL+p6flRe+wbN/wvrRUy17Iv8cKc
	cBp+Ee/uYQER4ngsgaYO
X-Received: by 2002:a05:6402:1d49:b0:663:4560:aa8d with SMTP id
 4fb4d7f45d1cf-663bac0b2a9mr9465681a12.26.1773750654417; Tue, 17 Mar 2026
 05:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773142933.git.zhoubinbin@loongson.cn> <bd5c06a20ef2e61f76902c4209f2be539ca91a97.1773142933.git.zhoubinbin@loongson.cn>
 <abAyd9uyl3TC8vC_@ashevche-desk.local> <CAMpQs4JVYRo4DQyEVe5NhHQ=VN96mF17AtSoo6a4CGB6w_Aphw@mail.gmail.com>
 <abFTF-RDxLqsSs6X@ashevche-desk.local>
In-Reply-To: <abFTF-RDxLqsSs6X@ashevche-desk.local>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 17 Mar 2026 20:30:42 +0800
X-Gm-Features: AaiRm50Kv8zppqeHF9w4EcoyL9629DqEk-04yGnKyzwAzL8KPJzuesVItDbOu6Q
Message-ID: <CAMpQs4J323uWkjPXYXwwb2URRV0wsfkiFAXOcNazejzdhEsx2A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all:

On Wed, Mar 11, 2026 at 7:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> +Cc: Bart (what's going on with i2c_adapter_set_node()?)
>
> On Wed, Mar 11, 2026 at 11:07:19AM +0800, Binbin Zhou wrote:
> > On Tue, Mar 10, 2026 at 11:02=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Tue, Mar 10, 2026 at 07:48:53PM +0800, Binbin Zhou wrote:
>
> ...
>
> > > > +     struct device *dev =3D priv->adapter.dev.parent;
> > >
> > > Derive it from regmap (and check elsewhere) as accessing dev in the a=
dapter
> > > may lead to issues related to the object lifetime.
> >
> > Do you mean regmap_get_device() API?
>
> Yes.
>
> > Also, similar references exist in `loongson2_i2c_xfer()` and
> > `loongson2_i2c_isr_event()`, requiring synchronized updates.
>
> Correct.
>
> > > > +             return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed=
 to enable clock.\n");
> > > > +
> > > > +     irq =3D platform_get_irq(pdev, 0);
> > > > +     if (irq < 0)
> > > > +             return irq;
> > > > +
> > > > +     adap =3D &priv->adapter;
> > > > +     adap->retries =3D 5;
> > > > +     adap->nr =3D pdev->id;
> > > > +     adap->dev.parent =3D dev;
> > > > +     adap->owner =3D THIS_MODULE;
> > > > +     adap->algo =3D &loongson2_i2c_algo;
> > > > +     adap->timeout =3D 2 * HZ;
> > >
> > > > +     device_set_node(&adap->dev, dev_fwnode(dev));
> > >
> > > Why?! i2c_adapter_set_node() is part of the i2c-next.
> >
> > Indeed, when I rebased the v4 patchset, `i2c_adapter_set_node()`
> > existed in the i2c-next[1]. However, when I prepared the v5 patchset,
> > it was removed[2].
> >
> > [1]: base commit: 6117e1ba1db78a52a4161208ea403d3769ad73c6
> > [2]: base commit: b82316862bea929265725c077dffcec42e3dc20b

Excuse me, I=E2=80=99d like to inquire about the current status of merging =
the
`i2c_adapter_set_node()` API.
If there hasn=E2=80=99t been any concrete progress yet, I=E2=80=99ll try to=
 keep
things as they are and prepare the V6 patchset.

>
> Bart?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

--=20
Thanks.
Binbin
