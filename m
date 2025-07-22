Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E7A28C5D5
	for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753192607; cv=none; b=NHgYNDIXocef2GFVWgmWwPKLEQLA2OL7YwrNGQ1xWLX6l3W131Ty1daRCVrpfrfBFdIuUDGG0MJhY5OyG6dHFNNoE99simoxzqSbyxfXM6HQz1nbnmWdFDAUGMLascr21VRhyGEXLE0qPyAikVYJRghpAb84X+eZIddI9+7/JSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753192607; c=relaxed/simple;
	bh=kYYGasiChIGrOp2WfdbyJu8FXaB5dOTDpOSPPXTmqKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7FwVppWki13yRGh+j6oqvDfObmvYJXgGR4dpwVg/n5mpSvqagvnbeN+ORDJ2iWBkxnJmlQxSskxSiJ7JkuoMuYQKtFy7cPoCTFh8ntvZ1/rCQ128JITL0GvVAv7Zg6W4iaG9PHSkfKDCPuAkAJO4GN4TNpF7oYFbFDEw6u92MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsHznXJk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsHznXJk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45610582d07so43416415e9.0
        for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753192604; x=1753797404; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=juq2LsaB2ZlgXJfLDxNWAXy+l+g+CamQA/55GYnNXGQ=;
        b=PsHznXJkAVxpNdbTp6EbzSbgU+T5rGAOkmgrUuxsVZbdvyLUKoZggjIvO0lc+vc3tW
         CAO77OdcvgxkEJL2HRNmzUzLeB1zy4K4UEf5v4wUCnMdghVwLeFdlJoFax3b/Ac25Giz
         bIFsP1ihvqgDj6lv7VH7rDWEDfJlInG0cTmv6B9UdQFapM/GD5bia8FNFTwf46vBlSpi
         r6slMaYkEFHYEg+Hemlo/4i20GKabHwZZihAfa4t3yncCBsR097BRHGD3xEh8vxFSW5N
         atFdorxeup/WGOSPJkgWcAUpMcxKLwoQlzmfBETpYD7xlUFeVxRc3ZDP74wXht/oW2OD
         U4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753192604; x=1753797404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juq2LsaB2ZlgXJfLDxNWAXy+l+g+CamQA/55GYnNXGQ=;
        b=AagLTdaiyiTWIXNGdytpSzpM3Xf/XJajmPNrzmo9laijKsRnmti4hovodtuRx07JhP
         kdkYZ8q74woTB0WnkXfCpXr21SpijQadOxsDMKhwZmSXfGeJ9fCxhQ/bxPbD3qncWcu/
         YwQkn7TUjWbvXWsfjjZVigyK9G2teTZPiQDlEIo6lCuFy0DCVH8ctlHLLZZ2vERKatqG
         i5WMvaVDi1wKwJx8NSWXk6yO6R+7dGOoGnIFdpZBxaZ+cNcs7y07XjqliZxhz1gF4i/u
         TQjmdTX0zJK0IpkEcKj70GXp1EVeMV7Q1yZNYNEzTBjyBmoD+nrYBoBoZ4glhbOdVV+K
         fFUw==
X-Forwarded-Encrypted: i=1; AJvYcCWJlMNQC7ue4j7bZ/krfxtBoxxjAuwOzaVaEkXOIGSvVHr65gZJivmvqpzOYXraKYZCENw+SGUkR1U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWLIngG+ss83s6XDzE0Lbxje92H2GiyI5NFI4IgCtdXKIzLMnm
	VfIC8eiL6AtUUmmePTktFjR8gNNW8AM4ogjwT/AIzVB3p2WrNWNwBuMc
X-Gm-Gg: ASbGncsu0MbKleIS28WlU6u7v4KYhL82Qy2Az1h9utYKnQ0XlM17RtiqQyl9yk9uLUj
	VkI6ADH19mbcSWju/1aVpnK3lv9M9iCNKPpv60w9Pmyqm3ykHfnXIVSnnO6GepUd09PIRo0Q/6y
	Y2/tdFVE/nRPk/xLV8IZe8Zgq69KfhVEP4ABkEbPzy51y/+7DDmtJZ812exr0tFYKAgVQ65rvyE
	WL06+0zsqDhGjKN72VEMsKQIOfURFRKLR0jx2LWE9CdLbzvRYs1KKtNtu0NMmNsN51aHseDYapf
	v3mhNGR0zEq3mYcLu0/LwfcFDSGxC/XYzYYXGNLJXQY93Ck3nmoXeOv0/d26gOiIsp9EeI1Xob9
	xjDWOflHnBglTQAN7wg1rp+CvVPvLw1FDPqG70rNxZ/9LGwaMR3PpAB9OriunB8fJLL+ApymgmQ
	pSyhR67J2q
X-Google-Smtp-Source: AGHT+IEXfV5AQDvaaCQOegEyKdsH0umt5I9YjBYWNMUwcatDOEmZLLM8MRQ3Lk0kGHyWW+MsfUSbDg==
X-Received: by 2002:a05:600c:c16d:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-456352d0b70mr190106725e9.5.1753192603600;
        Tue, 22 Jul 2025 06:56:43 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f2d4fsm197624025e9.4.2025.07.22.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 06:56:42 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:56:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
 <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
 <2025071919-patience-cattishly-cf7c@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sm7baow4ljogvsjb"
Content-Disposition: inline
In-Reply-To: <2025071919-patience-cattishly-cf7c@gregkh>


--sm7baow4ljogvsjb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Sat, Jul 19, 2025 at 08:52:41AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jul 18, 2025 at 03:49:37PM +0200, Thierry Reding wrote:
> > On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
[...]
> > 	struct syscore;
> >=20
> > 	struct syscore_ops {
> > 		int (*suspend)(struct syscore *syscore);
> > 		void (*resume)(struct syscore *syscore);
> > 		void (*shutdown)(struct syscore *syscore);
> > 	};
> >=20
> > 	struct syscore {
> > 		const struct syscore_ops *ops;
> > 		struct list_head node;
> > 	};
> >=20
> > Is that what you had in mind?
>=20
> I missed the list_head, so yes, this would be better, but don't pass
> back the syscore structure, how about just a void * instead, making the
> whole container_of() stuff go away?

Yeah, that's a possibility. I personally don't like passing the void *
around because it's easier to make mistakes that way. I also find it
unintuitive because it doesn't immediately show you what the functions
expect.

My understanding is that the container_of() should get optimized away
most of the time, so there aren't any obvious downsides that I can see.

But I don't feel very strongly, so if you have a strong preference for
void pointers, I can do that.

Thierry

--sm7baow4ljogvsjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmh/mJUACgkQ3SOs138+
s6FyzhAAq8z/gI18SVH4qmKTQkcFaPuXBegHTP2dgId1CA1dad3cmBj4tcAz1+Ng
liio3geyWrxKqZSJTrQOYYYloM4s9UhkY3AvXvDB+L4/DZC/HBgAGnL5dMKte/WQ
sNUniNOWw1gW2tluO+vi9saSGE4Test34XaIWpBaItJYO9uhuiAC57jJw9Uutl0h
wkjvwyxaOXSleKiCSwlnSBx31PCz7k5nhb8pIeptnxbxw+Q7+IsDzK/cH2PrV979
7AzVNifmqUfpO9Xy0FsSrYU0SrUCM7I8WU6elGSeuswDL7+Mlsh9kn/KfVyL86ed
0jP2iQRyzteg2ATh6dQJLM7KEPK8DnGZqaLDLJlzn3af7Mv5MvRGO1cx7dVGhcTA
ADto5YN6dKXC63ijHppnQ2xjZ725T1zuVpj1z5OTlXpKtlGvYiIejh+B5tjFMMrr
zTNbjIBbykgIZXvIvn52ttFRDrLgpnh2mQPzI8VWp9Bv0DaBH6Q1jfxUlWXQiSaQ
bWrFys6N7IBy5+o83FiAGZvQ//IFZhyF8T/6HD+6OuoX26vTOa5vwrPgs5qru2/s
T5iJf9UOqnHAuzssCGk2OZcqcVn17seSpXcJScckVPt/HhegIgcgxoVTCOBQ0K7J
xUhlsns/ZnbEGVKtLr2T/t7UTeCDZIkqo0pEloVCu9UGfeAI16c=
=Cczj
-----END PGP SIGNATURE-----

--sm7baow4ljogvsjb--
