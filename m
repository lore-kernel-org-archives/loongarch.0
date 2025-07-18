Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6422B9B7
	for <loongarch@lists.linux.dev>; Fri, 18 Jul 2025 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752846585; cv=none; b=QCwj3/BCDAe8gq/LNMgue/Pg+Yx2uB0LO/dGeFH5I3H1uxjidCHSnRYtkL6+7vYgAMneAioRTMl80sDZEXsHzi40nOi753p2Qqzx1jBidMW3wvLFFGekVHZhX6z4e8buhV3Qh99AtQGWjmEePf4/Sj5CXq1GiQZElbXg8YGekRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752846585; c=relaxed/simple;
	bh=MwMKvzg6GaOXygcJw3CXNPcuMDgDSIluKPqmVny5ixE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVEG5DYCifGwkOo/ptSzL+ntRZFVtnq9vpz8+Eyt2WtoTYEz0zsWkHETyH/nwvoUIQChq9NVFZLnganozRaUnOHfFw/kMplCgf2OrcRfYbq2DIimZJLWs2ySSFZZUIQzWes82EgO1t3y5EfXRghbzkXRy683FqjdtfaaGo9QxS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtYWBSXc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtYWBSXc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d7b50815so15682155e9.2
        for <loongarch@lists.linux.dev>; Fri, 18 Jul 2025 06:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752846581; x=1753451381; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AMgyOUgLIJ32PTJWBYJxdAEjZIylinigTisZq5Jwpk8=;
        b=FtYWBSXcGJxtmreMovAGTS2SmB0Z+wmmxv2Srj9gAvtgjnvsdP1CxbBAjCIuokfU29
         k+MhjO95ChG4MRwxspIW6EaGynkUegokAcWGV2jLjjIKpCpdVs4SsDoMMZmuw0TQ/pDT
         1Dtvj6p9QwwvyBdfUuy+nPR7KOvb+e/bWrUqvCYaCPDX9EKw5h5CZPMg1ca2MBXpEVSZ
         7tmcUhhcyUgWkHSfGPSiF7OwR7rPQ4LqwGTqrq2QKgeD7qun9718tpbGiiJR0u2VLUht
         H6raD5PlS0Vq6hoZR6VDTZthmuEuYuDw8W+oJA+thnBAOhDZK+KfBCsU1Do9oftovN7p
         DrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752846581; x=1753451381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMgyOUgLIJ32PTJWBYJxdAEjZIylinigTisZq5Jwpk8=;
        b=BunrkQCXAgsmrBQl89BFbGxn4vzlZShBwWoYaW9+xxzyTdH573WUJEFqk8l4Ygdil+
         4iwRBXv+Zu/5zlZx4A9digohFtI08dhWoMi6YMLBxRPpgYhR37uH7hhKfSb8saMARkyk
         Y711knmv2QO51TRIBW0heyKo8E6uhABlaDjPTZZTLXk7+oIiVcdzpww2yt9mn5uVd9L8
         JhHpnnggFnpoFVccaZSAVhUlXH2M949bzJHRL1yt5g0xlXIXCH634EOnXL8c8XJfPiN4
         a153S26nKMr6L3K3w7f4ffp3hUghyjV5qVwVwfS0DQ9heqnm0lu0dWbj2W4fYUUW79gC
         KCpw==
X-Forwarded-Encrypted: i=1; AJvYcCVNFUvgUOpypiwOTSXS6qEdhUn8qzdj7eGfathC4wnu0Q+p4GLEaRtTcyCBlHDXsVkQXzPaBn5PXl0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yybtjz3S10WPSWgFGx/BnYBzvdrbsml83S8iezD/akfHOYDP5v9
	GPyF6B/KUxR3VNTCTAN7RJDRmS6GO/C9jpK2YiZSO0+nSXKqzHFIqMg0
X-Gm-Gg: ASbGnctBp1IRxTAzi+OeQlT/7A1dUKNhyxbTrLLmWVt3ibZXVAvFawrz0DW/PvhN+Fq
	oeEg+pj5sNFtfnG4jnokbuBSFaHp6N/kVaJEmhTCYsC/Eau8pfQCtN3zC+na9sM3k9PwH3fESlJ
	8GxtUXVgcwZ2iLDDpZremVTrug3A1jVqYXu9uhn03sdmGWXiRqZR61DXDpogDPLSA20FW7O7Cif
	zra98inokNiC6Fk+yXQeSEGXeXqnXA0LDtEGMIwNGTXSgnsOPE82Yr4cDnOOyQqYvSCa5fFwojE
	q3Gk8+CiyupHP/nBmI24HayowWi6X8cQulA35ZNNi7/emLSzpcDbjo3iS4df2GCDFg6MsYTG2xW
	rMZIA3A9oZqIkWcKVkJLIsEdBvuDIK28idBwcuKoC14lI3t1Tpwgh8guQ0ikzMOZoIZBdY1Fzzw
	7Hj5QQYpZ5
X-Google-Smtp-Source: AGHT+IHffGdFSHvYOR3y1R1hMWHllBX1SeAON/ZoD7Ch8x5l+0sSh2Ktls2hMGgkwYE+UWSbANbmhg==
X-Received: by 2002:a05:600c:4e02:b0:456:201a:99f with SMTP id 5b1f17b1804b1-4562e373d4fmr108407665e9.18.1752846581084;
        Fri, 18 Jul 2025 06:49:41 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45626cde7aasm62335145e9.1.2025.07.18.06.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 06:49:39 -0700 (PDT)
Date: Fri, 18 Jul 2025 15:49:37 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xzuw4l5ej7k2fa3p"
Content-Disposition: inline
In-Reply-To: <2025071716-phoney-object-1648@gregkh>


--xzuw4l5ej7k2fa3p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi,
> >=20
> > Something that's been bugging me over the years is how some drivers have
> > had to adopt file-scoped variables to pass data into something like the
> > syscore operations. This is often harmless, but usually leads to drivers
> > not being able to deal with multiple instances, or additional frameworks
> > or data structures needing to be created to handle multiple instances.
> >=20
> > This series proposes to "objectify" struct syscore_ops by passing a
> > pointer to struct syscore_ops to the syscore callbacks. Implementations
> > of these callbacks can then make use of container_of() to get access to
> > contextual data that struct syscore_ops was embedded in. This elegantly
> > avoids the need for file-scoped, singleton variables, by tying syscore
> > to individual instances.
> >=20
> > Patch 1 contains the bulk of these changes. It's fairly intrusive
> > because it does the conversion of the function signature all in one
> > patch. An alternative would've been to introduce new callbacks such that
> > these changes could be staged in. However, the amount of changes here
> > are not quite numerous enough to justify that, in my opinion, and
> > syscore isn't very frequently used, so the risk of another user getting
> > added while this is merged is rather small. All in all I think merging
> > this in one go is the simplest way.
>=20
> All at once is good, I like the idea, but:
>=20
> > Patches 2-7 are conversions of some existing drivers to take advantage
> > of this new parameter and tie the code to per-instance data.
>=20
> That's great, but none of these conversions actually get rid of the
> global structure, so what actually was helped here other than the churn
> of this "potentially" allowing the global data variables from being
> removed in the future?
>=20
> So how does this actually help?

Thanks for pointing this out and letting me look at it again. Most of
these actually do get rid of the global data variables. The MIPS patch
doesn't because I forgot, but the __alchemy_pci_ctx is no longer used
after the patch (except where it's initialized to the ctx variable, but
that's no longer needed now). I've updated that patch.

The Ingenic TCU patch gets rid of it, and so do the clk/mvebu and
irq-imx-gpcv2 patches. The two exceptions where it wasn't possible to
get rid of the global data variables are mvebu-mbus and Tegra PMC, in
both cases because there is other functionality that relies on the
global variable. The bits that make it very difficult to remove these
entirely is that they export functions that are called without context
=66rom other parts of code.

I have a fairly large series on top of this that converts the Tegra PMC
driver to move away from this as much as possible. It's not possible to
do on 32-bit ARM because there is some low-level CPU code that needs to
call into this function. However, the goal is to at least make the PMC
driver data completely instance-specific on 64-bit ARM so that we can
support multiple instances eventually.

Maybe something similar could be done for mvebu-bus, but I'm not sure
it's worth it. Typically for these cases you need some form of context
in order to replace the global data. On Tegra we do have that in many
cases (via DT phandle references), but I'm not familiar enough with
mvebu to know if something similar exists.

My goal with this series is to get this a bit more established so that
people don't use the lack of context in syscore as an excuse for not
properly encapsulating things. These usually tend to go hand in hand,
where people end up using a global data variable for syscore and since
they can't get around that one, they keep using it for a bunch of other
shortcuts.

> Also, small nit, make the function pointers const please :)

I originally tried that. Unfortunately, the struct syscore_ops contains
a struct list_head to add it to the global list of structures. I suppose
I could move the function pointers into a different structure and make
pointers to that const, something like this:

	struct syscore;

	struct syscore_ops {
		int (*suspend)(struct syscore *syscore);
		void (*resume)(struct syscore *syscore);
		void (*shutdown)(struct syscore *syscore);
	};

	struct syscore {
		const struct syscore_ops *ops;
		struct list_head node;
	};

Is that what you had in mind?

Thanks,
Thierry

--xzuw4l5ej7k2fa3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmh6UO0ACgkQ3SOs138+
s6HHnQ//RJDy7HyKY3QGC3LCcmt2Vfyic7ACiUP72YYAnBKVHsFoF36OZi9Jv5iG
Bq9Go0qFfluWgOrOlsjmhHE2BEj6shRzh/+yjZWu4MpCdM2CpxnUz/bwHQryuDKL
3TMs47m/NEVQ0IqPBmMmqHjLoSZ8q1c5URJv8kzhGFUZPif5CfeDwU5Myq7IDMd9
yqc25SLzHS8bhHyFXDVzGc06uTrdwRbopvwS+VEFtupMNrGD/bmVo2f7HE38Vrgx
aoX6xxuDqTeRRonB9OxU0Upm0Kv/JGXetysgOLLHml2TvQudYg1sG/xbIQqymU2K
YopxcFWmObA5qAPRadidJChbWyaKpZXfr2rqsgvM28cnRmCjKIDRpmVzCsLpQHBb
fJ7tbGWQBz4ZFczYLM9Z6cjZPJFFuwHjzm9dRNH/ppJKWmtr23eSYuWX44kG19CM
644Z1OYxg9GBp5mZ7mGLu3HF8ycXWFKDoApp62SLm7TyHRTP/W0Kn90MqgHuAd4U
0RhHg1+7MlFBE9jC/X1Ac+RsZNaZUd+biEy6QvAkOHL5VtPxlR9OCKhftZcsPRuM
YdQVi9IgteKqzq0ul2dQbTD1LaqzrEYmFXJ1So3dTTSbOUqrb+VDt9Bqtfm7oGdG
O1NPiukTbLVBWb9QXt5vvJ6QXxC7wn5jdhgby0kUROvSnCkM+8U=
=McxE
-----END PGP SIGNATURE-----

--xzuw4l5ej7k2fa3p--
