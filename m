Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29F13EFFDD
	for <loongarch@lists.linux.dev>; Thu, 28 May 2026 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974855; cv=none; b=fqWVP8JCQMOx1nyEpcb/1cEK9UWvu7kJ/ywlAv8aX6DL9wpFJegApOF9CjrEiYuL3erjIBs/NmGG0NQSaNh+I2Zw3tKWDWuUveshTecp5OXiXdl+ns3bekJGk5QRSh4T2dB2PqJLKAmd7+E1w5GKC3IAHicBhcTuvO1mVnMZNio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974855; c=relaxed/simple;
	bh=RIaFU2XJHtIVIU1Q+1dhMPDocgMYReg2MIrRHb6jNU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h9XFAHrRNt4dTflykZShCZ1Ty3GReeK/MhgDlADfzKp4H0uuFE2Yyzx7v9kpVmiSC5JQSESJJgEJWKfWO5hO7EaufpBDtl3PQSCRqXfN5HMHzUI4mwztDtirBLVzWzU3Md5HauI0m0+XN5xoJEs0zRIZqHrjpwXC2BLqRMCd//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=josbuxqj; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="josbuxqj"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779974848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RIaFU2XJHtIVIU1Q+1dhMPDocgMYReg2MIrRHb6jNU8=;
	b=josbuxqjhdehCdKhRzCAofaZT19xUuNwvPu4XI9pv5Rw6SamLbNKucKkEI4Wb1/H3gyJbI
	l80ijGXpaziRBx6DZ8+SUi2O0JTyy1IlEV17nK3TwuhmoFskCTLjgEw0Bx8H03v67+m9Mw
	tjAEe8Oa46o35M9DXOW9m13hw7z1f6c=
From: George Guo <dongtai.guo@linux.dev>
To: pratyush@kernel.org
Cc: chenhuacai@kernel.org,
	dongtai.guo@linux.dev,
	graf@amazon.com,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	liukexin@kylinos.cn,
	loongarch@lists.linux.dev,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH 1/7] LoongArch: Add KHO basic support
Date: Thu, 28 May 2026 21:26:53 +0800
Message-Id: <20260528132653.190981-1-dongtai.guo@linux.dev>
In-Reply-To: <2vxztsrv5r6y.fsf@kernel.org>
References: <2vxztsrv5r6y.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Mon, May 25 2026, Pratyush Yadav wrote:

Hi Pratyush,

> Do you have nothing else for a bootloader to pass data to the kernel?
> Passing this via the command line seems crazy... All these addresses are
> now available directly to unprivileged userspace. Can't you use the
> device tree like we do on ARM64?
>
> Also, this commandline parameter isn't documented anywhere.

I have tried the FDT /chosen approach, storing the KHO metadata as
linux,kho-fdt and linux,kho-scratch properties (the same properties
that drivers/of/kexec.c:kho_add_chosen() writes
and drivers/of/fdt.c:early_init_dt_check_kho() reads).

This passes the KHO selftest when the system boots with FDT.

I am currently debugging the ACPI boot case.

Thanks for your advice!

--
Regards,
George Guo
