Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF572D03D
	for <loongarch@lists.linux.dev>; Sat, 27 Jan 2024 17:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706376688; cv=none; b=VT91goXm2WIZFmJOSQliGWi5pnPh5EDKQCY66cLV3AcvAr9R9c7GK/pk0ZcU91ZwLGQWLDxcpa040TYDNUUg8cqDDvFjsqGd9WNadXVCPgv0F2WI6RfnrwEbgl5zKAaX5s7ozA13ES2Oy6i0gPr58queJ7R4Cvd3snf5L+c/IIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706376688; c=relaxed/simple;
	bh=v/eRmXnwcofzCLUu7NDTFXzeYjOhl/y7gybN3TxLwFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUAsnjFhYiZJWcSayj7RAynezHZGkrVKTdYg6vcL/QeaHrrL5ENGI9Ks+nfgVipOf9ULYZr05+fcBE7ZletOMrgHxh6iexJFA1FeeF0H48JOwBCzl5ECNLLNjmq8SvwLJ5+og3UpW58EiRqnUW8238eGX/X0SMZAEFu3/1GvFFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgNKZfzN; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgNKZfzN"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc226bad48cso1168774276.3
        for <loongarch@lists.linux.dev>; Sat, 27 Jan 2024 09:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706376686; x=1706981486; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/eRmXnwcofzCLUu7NDTFXzeYjOhl/y7gybN3TxLwFI=;
        b=mgNKZfzN2c2aE4kKgpwUjptuLb8wrmBBJb5kXMYDMuUa9mtjh8MhIzbQwLInBkehXC
         MOmZnxE89XdsX08p7Pz+mcqfYlKmPR8tcxtnqopAmjWv9gXjekHWrdfr7tynuP4mm38q
         F02ZbPjSfwHcUT74bOir+IgIyxnWmzIC7o3ofgC14fiShiipgODj4xQL96Lfp8R/yEpX
         8jVYPGD+nNC7r5lrrBEHYaXY4px3wkEWVgj3am32JR2bGIJEIRCBNRo8Vi6kYrJqvyWp
         KkDQqju7WHH7f50LSJGR8BX+OVnhDtNUnXMvdq+LmDobbxUCfcNpn+fvser4IJFkQzjr
         IK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706376686; x=1706981486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/eRmXnwcofzCLUu7NDTFXzeYjOhl/y7gybN3TxLwFI=;
        b=KlSsmyNCZl10jBLjhm5zuFQIo0Gxa8+SVOPXN52OV8t4nBcVkEHk/pb72AhkgpfYOi
         q7t7NWqoxUTh4yIlWUuXyFkIkgwnvZZ+DwSdT3onDPWO/gP6Ach7v0gqOM51sjqEKdAH
         0GQNYXM08tu60UUStR1DyiO8DLiOV6naYbh/pWcWXBUGQUPKMVPWZX2fM9Be9Z6SPLG2
         2dSQc6/T7WEO/Bpw7QTP1posbPGd2BWOTH2qkNPadtuXhj5l6k2TkY2DEbw7KrX1BkuX
         3FOkUweOhx590xgI5A9mwLnNl8fd9rdSa72Cg4t9nA4o3VS6dn6QpJMqyB8LrNI1Uajh
         V9mg==
X-Gm-Message-State: AOJu0YyuFtthpdcWjrof7OGNXO7FEIdi1LAE8sdvPf/i/3HdpEDVlzlM
	CLmdHGdRk9jYX+P6kQs4Hsd6IPIoxXOUeV5bOJx3r9IOiRZRE1M63OfdRgGGYW3Ej0cy6QaxhzA
	6O72/+HmlhHWFI6NQ0ek/qwRElCg=
X-Google-Smtp-Source: AGHT+IGT6QA+Fv5einVWUruH4wFZtEDFhs+QsdbfleXhdDOmi22jhHOwpbUDt75IdkG3ywsAidiVPQmqlmIUB3+EsHY=
X-Received: by 2002:a25:8c88:0:b0:dc6:3d4d:c953 with SMTP id
 m8-20020a258c88000000b00dc63d4dc953mr823284ybl.68.1706376686077; Sat, 27 Jan
 2024 09:31:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-2-Jamie.Cunliffe@arm.com> <CALNs47vzQm5MbfJtMQR3p+W1xub3KHiNqRgEQGWT3u28fpQ-oA@mail.gmail.com>
 <CAHirt9jhbnXz34D-pmHNecMfkefL4wTr9LYj_V28OsVd=fkdZA@mail.gmail.com>
 <CAK7LNAQKxrV-oxouv9F6+_i9-oGvJNBzFNLo+5PdqwWVd9qWZQ@mail.gmail.com> <CAHirt9josVNzcwCM5Y3MsVJC9dz+iRg6r_64OK4NWPeOOo_X8g@mail.gmail.com>
In-Reply-To: <CAHirt9josVNzcwCM5Y3MsVJC9dz+iRg6r_64OK4NWPeOOo_X8g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jan 2024 18:31:14 +0100
Message-ID: <CANiq72=aO-786owBb=0m5x09nMFenRendPZxd2fnsa6_nZHHCQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
To: WANG Rui <wangrui@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 27, 2024 at 6:08=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wrot=
e:
>
> I agree. It would be great if Jamie could squash them together.

Either that or perhaps Catalin could do it at apply time with your
Co-developed-by and/or Huacai's Acked-by? I could also take if needed.

Thanks Masahiro & Rui!

Cheers,
Miguel
