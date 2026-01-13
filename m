Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135CA285418
	for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 04:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768279331; cv=none; b=mlk9SjroT24pK1C8n25Ru7ThVnbs5B+VRv0UdWRll77tmBGP3ImZZk1gnIChOEoObBX/btkiWps3Ny6AX8p/seGDEIztj9m4cA4gGUv34h+/MZthsuiEQhrkuzET+sLJRkfBzPb5HbOrrXn2iTxUqF/+wqvvpV48ZP40fOLfHYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768279331; c=relaxed/simple;
	bh=kJYCXgJaBFGROYrM4z/Y/a+i/odNdursZw3fa2ISiLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttbU2ukz6xJHpHSjUugEetsKcy0oVlOnjUXxvFekPMZWF2ePBNPdALwnY+kJAzf8hfwSxAw81NLp15eGyuyV6xuXgrKrxT5CxuWV6ppe2ZBIC6C0OICS5zjfpASwflVRweHYgclh/s51WMZoLD9LagX6ccDMJEcLm+8vj1V0igU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDQAcsda; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDQAcsda"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so802623a12.1
        for <loongarch@lists.linux.dev>; Mon, 12 Jan 2026 20:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768279328; x=1768884128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/lDQFu0LLEkZhQXSlidHvFYOofM51JncT3Ixf9RmME=;
        b=cDQAcsdatgaewcXP6iPa+NfzfCKKeNNmwgBH+6EvUTFomnn/6YTYYi+mBiMXQBvQ7X
         0b4qsXjuhEc+ThVlYLw3PBgJjvo1MZN8GbmMekdZepTDStSEHnZj3KCpvNs1BkJmPbbQ
         tKJDDCzIXJtgupSYgDW3cX48OW8Ur5uDmlin2EQIfC3JonMMPFdALirZ8ckOWAVyiaVr
         y6hN0YAlpN7BGyFaTDs49Cp9XnVIR4cD9DRGUvlr+LMLGPzdbipTKedXowNlUBHjxAzD
         f1T1lYN/aqtGf3OTngBNyq4mWe9r6g+veTRQwtEFd++bUQIA7Odeg2xnN+wSIdiz9sNa
         b8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768279328; x=1768884128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z/lDQFu0LLEkZhQXSlidHvFYOofM51JncT3Ixf9RmME=;
        b=hPbKO+mG+zx9xN+EEjB9D6Wj0s4o9DnxokZeZ4y7PBRMtpTV4pVLN13WlczuQlKsqE
         kO4NY3qYf1cIQ0BlkLFN61Xcx5behcpAu6N5sPLva9VUpOayd6nRgB0dJQ71DSr20oXb
         wcimt2wU/+NUDnp/Qxg/5pOS3KHE9nKVWEGajonMlfLRp1ghpOEBlHtPCkKhTNOMDxG9
         866i5VVge0r6p/uNCfHOjozar1JGagVQBPtxYY1lbk2XmJRzPMvhacp8bI4cNe4SukuQ
         knovHolGjFIjWjTSN9QLP/s32Jpl1gPkfF87iuEJW1dzfP3mSNB1LrSR/QdsaYOXxb3w
         JvQw==
X-Forwarded-Encrypted: i=1; AJvYcCXd45lImEhYZsFBZB6+WY5uzV/HCtliYk+MW13j6ZcmSDYQb6F/w4f9zFQmNNAHMFUliiBxQe/GTp8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUXDW79+vIJQRJWdseO7l/UPuzlElCjY83+9izM0rXCHg3UsMN
	bg795lEz+DSU1VV1KeiJX4IYZmp80CD8hsROZ1Bi1Lz8azBuo48e52usJh/rXggKeour2eTk6w6
	qwKfqtkHqP2pvLG61qZHWCzVJRzIJ1POfTvT6Fp8wpg==
X-Gm-Gg: AY/fxX6IjLk3aWtTs/hQhVHdxEN/uek+WSbBD8FiYIGj2f9hYZHzh3XJNIiK/UY8gDg
	YlXzxsAWpZRZ8izcyI4nCQ9WmfdczZoZz7q4YiwaLx9OTU0zUafgGYWmwIfaVfm1Y+hP7O+nhuU
	WK8QSffEKF3qCO9KsEXscy/FaiXCt1BvMcpOGJWTweSztvu2HvU0nMdf81oO00bqyvqv0xzrW3B
	G9nqdEcUaJLh1b7mlhKK/hKZlgFamXSV82Vl8PVTWyvFqTciSxZdPN2taT9xsW+dxn71dSKdS/I
	YQnq5N66BSJBopCjLndqrE8KpKt5tlRyzz8MybooWSGeVtKa0OJZvG6eZXS31jpO97DOk/oNu35
	KMUkuQF8T2KABTzFLrWIA2Mq818C0itmFe4auGA==
X-Google-Smtp-Source: AGHT+IFPvxasewnmsZAsth9GQCtldIq0N28CE0vaBHwg8p8y0sWAlCae9biBesZox9b2s7LDJyYfaWiuotYB2z+2IOU=
X-Received: by 2002:a17:907:96a3:b0:b87:d44:81d with SMTP id
 a640c23a62f3a-b870d441169mr530583566b.45.1768279328057; Mon, 12 Jan 2026
 20:42:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223080437.3367240-1-chenhuacai@loongson.cn>
 <20251223080437.3367240-2-chenhuacai@loongson.cn> <87bjj3rnra.ffs@tglx>
 <57748542-d86e-4528-bea3-8f8d8f1abbed@app.fastmail.com> <87h5suiktj.ffs@tglx>
In-Reply-To: <87h5suiktj.ffs@tglx>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Tue, 13 Jan 2026 12:41:59 +0800
X-Gm-Features: AZwV_QgSQWVMftLV5ZoAJMh5f11XKI16WyCggEzu1UJGjbL-ezZhFfj55nYh6OM
Message-ID: <CAAhV-H7NtSkWKeP5Kq0fvNM0qqWfTq7TAeGpmnkmPSJBBzu1KA@mail.gmail.com>
Subject: Re: [PATCH 1/7] irqchip/loongarch-avec: Adjust irqchip driver for 32BIT/64BIT
To: Thomas Gleixner <tglx@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 4:37=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Fri, Jan 09 2026 at 12:23, Jiaxun Yang wrote:
> > On Fri, 9 Jan 2026, at 12:09 PM, Thomas Gleixner wrote:
> >>>  static inline void avecintc_enable(void)
> >>>  {
> >>> +#ifdef CONFIG_MACH_LOONGSON64
> >>>     u64 value;
> >>>
> >>>     value =3D iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
> >>>     value |=3D IOCSR_MISC_FUNC_AVEC_EN;
> >>>     iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
> >>> +#endif
> >>
> >> Can't this be:
> >>
> >>       if (IS_ENABLED(CONFIG_MACH_LOONGSON64))
> >>
> >> which is preferred over ifdeffery?
> >
> > Sadly, iocsr_read64 symbol is only available on 64 bit systems,
> > so it must be guarded somehow.
>
> It's unconditionally defined so using IS_ENABLED() is fine because the
> compiler optimizes everything out before the resolv stage.
I'm sorry but IS_ENABLED() doesn't work in this case. Because
iocsr_read64() is not a regular function but a compiler intrinsic, it
is handled in the pre-process stage, so still causes build errors.

Please ignore my V2 and I will re-send V3, thanks.

Huacai

>
> Thanks,
>
>         tglx
