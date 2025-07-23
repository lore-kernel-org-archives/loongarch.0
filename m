Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C7E283C8C
	for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 09:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261274; cv=none; b=kixOSMlvzvg2I/G69U1ScAgN0PGeNCjiwIXZUdkPz6/mNwJgrCYrtO4LdqB6cTQSSrQFY7SaZxTpTWgbrcoxlPLok2aa+g7Qggzg4svk8++qfB7fUvuTKPTL4txJ2M5Q2cyQAb8Nh0HIvDm5KHbTbonYaTGdSgSawXggmODzkNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261274; c=relaxed/simple;
	bh=HVQUD3Ib6X4vO1vXKL8LG+SI0kZlkOlq4KpZxCl65JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iks2YfScb2zL0OToQI07fr0RlB333hHC186ez81CewbAdtCyLnYEl+iugyCjQCXC2Yfe4aRvOFSN4JSaSWapi4+hN0FQNc0WYzRHMsNtlg/fJajb7Xh1BCN1DIT+PILSCGQ2VBHnrH7TvgdUbIRzjzCR0aKcz93N/bphD6lC3GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBjQ1I4F; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBjQ1I4F"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45617887276so42463275e9.2
        for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753261271; x=1753866071; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfi+7jzS+QroB9ovq5xCDmfLCYDKNlqIdXI2M9FMRkQ=;
        b=MBjQ1I4FereswEVK7NX9749jy2G80yzOcZWiyI8QccNd0YQCdDVnLVASLCJ1ZZonfK
         JM/gFdKHY+gC+iD6bjauafCQ/P2y1inwLuxd0g3mvVoJJKFW1lttlC7BIYzafa+gnHPY
         EsQB3gJ1KEHfZUFMrVpBzD+Ff8qptnIiuBgaxY3mZMrFojuppERrEwoZjTRHRHxW2tyb
         yS0izuKiu7/AAHM3NrRLvmg2x8y/IsxMBcXAtIXymHKcRCxTdrO0S6oby6BYF9pJh8Y6
         BmmQnmJtG2FjvP6m4IPaTEeUM0D0pxqeQpl2yB+PuLuG3QJBm0/DM0E18QLaZR9Jv7K6
         bwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753261271; x=1753866071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfi+7jzS+QroB9ovq5xCDmfLCYDKNlqIdXI2M9FMRkQ=;
        b=pKhI+z3L6Va15ddMzn3DZO41dP5usAyX18yHBna8JAZ471DGgDgSsTZJBeH/sPekTS
         VwfnFQ2K34q548tw7FdQsl+obgIsQbkHVaCE4RXT26kLPqVVFRvjrQrq2FiiSgU84YIA
         Ihcs7+KPqYsQBCogCZIR0mg1ZX5xE8Vqeggx8XAvibauDsaftWSztOF4UsLAa2/U5H2n
         AZl0yy04h9HYXpFQwJ7LEBfZqa3YwGVqcr0o+KS13qYmqfThrtjg2FX7n319J2HicmiO
         ZdnJR7CMGZu/yCI3MacPD+/KtnOmq/8XXPF6v4AzFQ/WJKB4Gn2faADY/edp+JfOR8h0
         Fkew==
X-Forwarded-Encrypted: i=1; AJvYcCWDZnxS6gu7X5IopDJum10TbT1/YuUz8OQwJ+AhkKyIwsTNI1NPPNjjDTiUaiy6ED9kO+yKqyG5gBI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwB5mC/5aBGelX7VRZGTiBxe6WG8LrSnBuUByNUN+GEbHv0K39E
	ysQbMbHCrpz1soGiPRLweNVrSYT2i4eXObX0/KEMyI5IoXFwWJd8hmf0hKmmlQ==
X-Gm-Gg: ASbGncs1SrQpSdxTm/BCkNeo22ZlP98TJfXKrkCrIRlfKPCAWFoyZxumFeJm0eQRFXs
	VtHV/KS6Zrvq2igUZF0xP0OUf+6xU4FJDS1+TSugXVgreoBe3sPHbgrk2/YKoHUptfgA/E6Ek/n
	LASf4/4DiNhLddNAswoM3ObL0Q1hHj5ZTNTAnllb2MghhUK+2vF3nAeNofxmaBMGuggKDodZhJp
	uO3hqRJPmvzuSa/kNLCLZz6TrWX4BkXVnZDbEmtggN6kzsf7j9J3xhqD+bHpBhr8TEs1Xl0b+kq
	5NWDrksxuVUTTRdjUahEbLzKX3mZsvDcSBld+bEfGpvs6ms9y+m2L8E/TttVTDCqyw3nbN78a6G
	vXgAhnQjcahU48Ppr/jMsuCsbACMYqvr5PbabwPrbMA4WkDbLgqZwQEk1NuvVnxU7MIVQXv3dnD
	esfxTbbZwu
X-Google-Smtp-Source: AGHT+IEknrstHg6cUD/SgoHhNho7BNCTRJA/GS5vJOJzPvYI6zayldv/5uJL7C58FRXa6VpYJz8Fmg==
X-Received: by 2002:a05:600c:8b08:b0:456:1b93:76b with SMTP id 5b1f17b1804b1-45868c79052mr16967605e9.4.1753261270574;
        Wed, 23 Jul 2025 02:01:10 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca25533sm15448303f8f.11.2025.07.23.02.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:01:09 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:01:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <awvdox3bgabbc42aamezlg33k4cje6y75qoxn7ruh3nhd4qv5n@u3spdahehad4>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
 <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
 <2025071919-patience-cattishly-cf7c@gregkh>
 <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
 <2025072218-decipher-spree-327d@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t3b24mrvydogtoje"
Content-Disposition: inline
In-Reply-To: <2025072218-decipher-spree-327d@gregkh>


--t3b24mrvydogtoje
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Tue, Jul 22, 2025 at 04:08:09PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jul 22, 2025 at 03:56:40PM +0200, Thierry Reding wrote:
> > On Sat, Jul 19, 2025 at 08:52:41AM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Jul 18, 2025 at 03:49:37PM +0200, Thierry Reding wrote:
> > > > On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> > > > > On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> > [...]
> > > > 	struct syscore;
> > > >=20
> > > > 	struct syscore_ops {
> > > > 		int (*suspend)(struct syscore *syscore);
> > > > 		void (*resume)(struct syscore *syscore);
> > > > 		void (*shutdown)(struct syscore *syscore);
> > > > 	};
> > > >=20
> > > > 	struct syscore {
> > > > 		const struct syscore_ops *ops;
> > > > 		struct list_head node;
> > > > 	};
> > > >=20
> > > > Is that what you had in mind?
> > >=20
> > > I missed the list_head, so yes, this would be better, but don't pass
> > > back the syscore structure, how about just a void * instead, making t=
he
> > > whole container_of() stuff go away?
> >=20
> > Yeah, that's a possibility. I personally don't like passing the void *
> > around because it's easier to make mistakes that way. I also find it
> > unintuitive because it doesn't immediately show you what the functions
> > expect.
> >=20
> > My understanding is that the container_of() should get optimized away
> > most of the time, so there aren't any obvious downsides that I can see.
>=20
> container_of() is just pointer math, but a cast is even faster :)
>=20
> > But I don't feel very strongly, so if you have a strong preference for
> > void pointers, I can do that.
>=20
> That's what you really want to have here, it's a syscore data type
> thing, that the callback wants to reference.  Just like a irqrequest_t
> function passes back a void * that the handler "knows" how to deal with
> properly.

IRQ handlers are different, though, because you pass the void * data
when you register the interrupt. That void * then gets stored and passed
to the handler when the interrupt is processed.

We'd have to change it to something like this:

	struct syscore_ops {
		/* parameters now changed to driver-specific data */
		int (*suspend)(void *data);
		void (*resume)(void *data);
		void (*shutdown)(void *data);
	};

	struct syscore {
		const struct syscore_ops *ops;
		struct list_head node;
		/* NEW driver-specific data */
		void *data;
	};

It ends up increasing the syscore structure's size, about 33%, though
given that there aren't a lot of these that's probably negligible.

What I think is a bit more unnatural about it in this case is that we
embed the struct syscore into some driver-private data anyway so that
it becomes per instance, and then we have a circular reference:

	foo->syscore.ops =3D &foo_syscore_ops;
	foo->syscore.data =3D foo;

Which looks kind of weird. Alternatively I suppose we could completely
rework it and make register_syscore_ops() allocate struct syscore, and
hide the internals from drivers completely:

	err =3D register_syscore(&foo_syscore_ops, foo);

With that it may be problematic that register_syscore() can now fail.

Thierry

--t3b24mrvydogtoje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiApM8ACgkQ3SOs138+
s6G76RAAlyjbBOBTf8eNokhrwb69GbuFv4iEunTnd/Xy91IhOncqHjdYHN3rqTn9
GZWy+L9VFYLaEmLV5W1ChOD3rYHCxZ3gep+jdE5ThLQvJaK4IBB4oGZ0OGXLHmVy
TqNy+Tq/dQi2jM2o7MW1DUDM8EunrbLmjBWZZONJzH18GqJPn3LWazuC7tBBL6vu
bmowzEXxm+4NWx5Ow3IvFnLzDa05JLaBKtVREPuf/UdRHcjzrra1RyYLyaYUI9Gy
pWZHkgUA+1gAO2hutK8eyL98cZlnl8zrArmduJZsyZQhcNe1ltwPTzUq9wejYOr+
Vywgy/CxznLtvKd0e27hP/I7zCx64ktofCb6l0SwueraLWYTcpJLQ23T93g1bDwY
02o6cq0874YQdndJytU7t3cKETe5uXF0AGmepX/+GKvcQN6lBqo04OL+Ge6yRMyy
G9gv6P2nxqY+RWkDrFtqO6RwFB+lJSwc2J3RfxHC/2ygMy2Zr2AJ5oeeAKOtTZ/0
smpK40Y2FB6y4ohGq3UK3uPyBvOJi/jw6sMuRyv2Ou7tJIFE2EtSpA5+m5DcwUcR
gRcfO6O0V9Y6qWBx2Tt+i6Fzekj/0xBzlQdyvCom8xrhRZ9VGbZBfpIaXDs/Anp6
ovlk/rkbo8DsYQQxINnmSBx2uQcWSCYAU53leg5fnr4EoSGPCsg=
=l8CI
-----END PGP SIGNATURE-----

--t3b24mrvydogtoje--
