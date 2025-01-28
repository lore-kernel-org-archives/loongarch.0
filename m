Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB41A9B2B
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738078067; cv=none; b=LqJ29NfZX7PG8bs2vPgEe20GPJpzbpfnIV/k2KStz/84z+1NRo4C7DTvFsTeRxpHB6CcWRXvgqkvT1vDOkr2zqXROxnF6B24YZxPcojLITJxuhbkNoVW+ML/g6x5YfBg/cRpETFhT7C5r04LBFZiAvntDscCb0AXz8Zds3/6SUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738078067; c=relaxed/simple;
	bh=64WRzii+HHHNzMJK8b6AdM6KHNHw1orjDWgGdm8k4k8=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=SNkKNhria6huS8YycOBCnLrbNvTE9G/mvhqhxRWaopQ1Z+lT0dF7FmtK7IC+JsXbTEWfGAw3wa0c3ts5jS8u5ooXxa/BXfUJ7+DFElEwRgeWu6qHSVEMJovGr+1HGEXzJzcUpmQd9tiMtpbSoJ8XObPHPqyeESnhK4UC5JLAZxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r9YjKK+C; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r9YjKK+C"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738078058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFCNtAn5R1/J8OkrjH7fIuh6DZ056MfqldMmOKH0a0A=;
	b=r9YjKK+CYNqhDq3GjbmHTYN231J4L4YZ1VwSAFkBHmJpNjoAjHhctZN10oH6ZDF1iE7Ogh
	HSIwBkp1KU9plof6T8OyUsybaxSn6xszzKr5jqCLGqNhIsXuNE0jpPgLXmnHnhS9owCHUT
	OjcUX6/Mcar02C9KT6MD2yKjJUcKcGQ=
Date: Tue, 28 Jan 2025 15:27:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yosry Ahmed" <yosry.ahmed@linux.dev>
Message-ID: <0e3b587f8905c276952963122a675597d1774dbc@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 1/2] mm: zbud: deprecate CONFIG_ZBUD
To: "Johannes Weiner" <hannes@cmpxchg.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Vitaly Wool"
 <vitaly.wool@konsulko.com>, "Miaohe Lin" <linmiaohe@huawei.com>, "Nhat
 Pham" <nphamcs@gmail.com>, "Chengming Zhou" <chengming.zhou@linux.dev>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
In-Reply-To: <20250128101442.GB691108@cmpxchg.org>
References: <Z5gdnSX5Lv-nfjQL@google.com>
 <20250128101442.GB691108@cmpxchg.org>
X-Migadu-Flow: FLOW_OUT

January 28, 2025 at 2:14 AM, "Johannes Weiner" <hannes@cmpxchg.org> wrote=
:



>=20
>=20On Mon, Jan 27, 2025 at 11:58:21PM +0000, Yosry Ahmed wrote:
>=20
>=20>=20
>=20> The zbud compressed pages allocator is rarely used, most users use
> >=20
>=20>  zsmalloc. zbud consumes much more memory (only stores 1 or 2 compr=
essed
> >=20
>=20>  pages per physical page). The only advantage of zbud is a marginal
> >=20
>=20>  performance improvement that by no means justify the memory overhe=
ad.
> >=20
>=20>=20=20
>=20>=20
>=20>  Historically, zsmalloc had significantly worse latency than zbud a=
nd
> >=20
>=20>  z3fold but offered better memory savings. This is no longer the ca=
se as
> >=20
>=20>  shown by a simple recent analysis [1]. In a kernel build test on t=
mpfs
> >=20
>=20>  in a limited cgroup, zbud 2-3% less time than zsmalloc, but at the=
 cost
> >=20
>=20>  of using ~32% more memory (1.5G vs 1.13G). The tradeoff does not m=
ake
> >=20
>=20>  sense for zbud in any practical scenario.
> >=20
>=20>=20=20
>=20>=20
>=20>  The only alleged advantage of zbud is not having the dependency on
> >=20
>=20>  CONFIG_MMU, but CONFIG_SWAP already depends on CONFIG_MMU anyway, =
and
> >=20
>=20>  zbud is only used by zswap.
> >=20
>=20>=20=20
>=20>=20
>=20>  Following in the footsteps of [2], which deprecated z3fold, deprec=
ated
> >=20
>=20>  zbud as planned and remove it in a few cycles if no objections are
> >=20
>=20>  raised from active users.
> >=20
>=20>=20=20
>=20>=20
>=20>  Rename the user-visible config options so that users with CONFIG_Z=
BUD=3Dy
> >=20
>=20>  get a new prompt with explanation during make oldconfig. Also, rem=
ove
> >=20
>=20>  CONFIG_ZBUD from defconfig.
> >=20
>=20>=20=20
>=20>=20
>=20>  [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=3D2Ww13s=
Cj4S3i4bNndqF+3+_Vg@mail.gmail.com/
> >=20
>=20>  [2]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed=
@google.com/
> >=20
>=20>=20=20
>=20>=20
>=20>  Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> >=20
>=20
> Can we just drop it right away?
>=20
>=20The two cycles for z3fold were basically in the "not worth bothering"
>=20
>=20category, since very few downstream production systems rebase that
>=20
>=20frequently.
>=20
>=20zsmalloc has been in use on everything from mobile devices to large
>=20
>=20servers for years. It's been the default since 6.6 (Oct '23) for
>=20
> zswap, and the only option for zram from the start.

I certainly do not object, if no one else objects I can do that. We can l=
eave the zpool code around for a bit in case a new allocator shows up tho=
, just as due diligence.
