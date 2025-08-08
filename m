Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F801A316E
	for <loongarch@lists.linux.dev>; Fri,  8 Aug 2025 03:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754623497; cv=none; b=oYKNrRpYrgwSoKdPataCK5HqSXIiVaJnvwoFKWz5gB8UWsvztrI/iyr1y9GXzkfn8LrMrbBzEux64cS9cxhlWHjUGoSDVcRaO5VlzkH7fBqAXPDklIawXGIOP48IJACOUEZscndkuqdFGPtI0Yd145c0a6sfvpTiQP9q3AqGp0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754623497; c=relaxed/simple;
	bh=v8GDNEIi9lbn81vS4caFfixjtkJApabqQOseMwgckDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tG/gafYNp2OZXiX4/f5bMC/N7W4YcJ7ttGinLZ4Nt0VOKVzJijw87yB3oeNiHZvGhPYQf+cOczy5to0+GAwh4PSwr3Ulw5u7ywCBKou7Sav12lHIQMUwU6Lpc120rCe+oiNMmMfwAueE00ElowCNPLK4OR2HG/ztt9HIGbVwHTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=RW6fqMkb; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="RW6fqMkb"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3BF6425F86;
	Fri,  8 Aug 2025 05:24:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsKhSEmxzj7b; Fri,  8 Aug 2025 05:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754623493; bh=v8GDNEIi9lbn81vS4caFfixjtkJApabqQOseMwgckDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RW6fqMkboQybaKy7Qm/nQdYWJRQTRFevKW1s8cIPAScv0IGVjkaLcyRqR4q3sOwpw
	 zXqzeEiZh7MlaHK22rrG43FrfUWhdO2QWpKE4+nVRSFxF9CAsIMoDeV5/u55DVTmOh
	 NhosSsURdngta1JAtKynrQ9yExSutJBLz5cEXVeCHuceMAhFq9cD9waCWBF8nrilbT
	 Of6qxMB0E0HxewaDbvD2whIe0usVwbdPBHHQK1WTe9E6bSXyk1IYW3S0c63WOxU0OB
	 iqCXm05oGPiXqqgG05AjdBX+VyLTgAy/xDX6YUTN5XLi2ceDtpA9NkXkogBPAxRZ5Q
	 5Go+8XIlx6pAw==
Date: Fri, 8 Aug 2025 03:24:44 +0000
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH v3 3/8] clk: loongson2: Support scale clocks with an
 alternative mode
Message-ID: <aJVt_DHt0snAHnY6@pie>
References: <20250805150147.25909-1-ziyao@disroot.org>
 <20250805150147.25909-4-ziyao@disroot.org>
 <CAAhV-H59x+KGJ8Jr4bDG7EG78aFSN=Rn7ZbkroPwHw-YPTf49Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H59x+KGJ8Jr4bDG7EG78aFSN=Rn7ZbkroPwHw-YPTf49Q@mail.gmail.com>

On Thu, Aug 07, 2025 at 07:18:33PM +0800, Huacai Chen wrote:
> Hi, Yao,
> 
> Can the subject line use "clk: loongson2: Allow ..." like Patch-2 and Patch-4?

Sorry, I don't get the point of rewording the subject... do you think
this looks more consistent?

I'd like to keep the original subject since scale clocks with
alternative operation mode are a relateively large feature, while PATCH
2 and 4 only introduces one member or appends a new flag.

To be honest, actually I don't really see a meaningful reason for
rewording...

> Huacai

Best regards,
Yao Zi
