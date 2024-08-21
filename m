Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25E11925B5
	for <loongarch@lists.linux.dev>; Wed, 21 Aug 2024 06:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223119; cv=none; b=b5Lv9UIvT3ebCCpTIRqDpOFwQ2KshOCwiy7lRLJjOJTbAJWRj65a3J8imex1jQf36y2bpCcSNZyhX7++5GO8zZw2I8mTcWyMtn3hKt46m5+YcrT/3sUv7hgAg1IC2hGF3lX6nU0CLIFO0n3Y0dcX8wnlDOc4Bp/+txUrCQQDkv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223119; c=relaxed/simple;
	bh=dBMwlGrF9h7B+c2j38R2xQRIALuQBmQbPQ1UzDOGe6I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mrNGdiKt4jdcEXYBZtdqnGmFF9FChH3p/nKQVa8V0TImZwoNJ51uYd1DyjBv42BXopaoYRA8vO1AAwKxHSUJY3lD6D+UIrKq69syiaR8iJaCUPiLm4G7P7sKjTVjV/39auoT8LhyuyBBZPJd+HBEfeivTFc1e+tkGeiCS5M6H5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=jrqukcAu; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="jrqukcAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1724223109;
	bh=dBMwlGrF9h7B+c2j38R2xQRIALuQBmQbPQ1UzDOGe6I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jrqukcAu5JIaBYH68uL1xX6JFLAeY1kPKfis+yQZTVchgzRlZN42+S45aS64Zp5sG
	 rV11E05hVhr5nZS32Pni/LxjKRZXASOdkVXAoN43ehandJEFLdeEIOaWNjD007DAx0
	 3ZgiAQrrojgBYbWDJnybo7oY7IHMFJMWJUYWxRcg=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 5BEF966F26;
	Wed, 21 Aug 2024 02:51:47 -0400 (EDT)
Message-ID: <85d64a341fa0d2dd57ed1078b694effc90b2e33e.camel@xry111.site>
Subject: Re: [PATCH v1 1/2] Loongarch: EDAC driver for loongson memory
 controller
From: Xi Ruoyao <xry111@xry111.site>
To: Zhao Qunqin <zhaoqunqin@loongson.cn>, chenhuacai@kernel.org, 
	kernel@xen0n.name, bp@alien8.de, tony.luck@intel.com, james.morse@arm.com, 
	mchehab@kernel.org, rric@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org
Date: Wed, 21 Aug 2024 14:51:45 +0800
In-Reply-To: <20240821064728.8642-2-zhaoqunqin@loongson.cn>
References: <20240821064728.8642-1-zhaoqunqin@loongson.cn>
	 <20240821064728.8642-2-zhaoqunqin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-08-21 at 14:47 +0800, Zhao Qunqin wrote:
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -179,6 +179,8 @@ config LOONGARCH
> =C2=A0	select PCI_QUIRKS
> =C2=A0	select PERF_USE_VMALLOC
> =C2=A0	select RTC_LIB
> +	select EDAC_SUPPORT
> +	select EDAC

This line looks incorrect.  It's forcing the users to enable EDAC even
if they don't need it (for example using a non-ECC memory).

And no other arch does this.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
