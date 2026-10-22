Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678912;
	b=jZu6hBrQhmM2hihhPLNaa1Iy1sNpzG1VEcwysa6byTr38RXA1Tjk0JOgZKuZu/xOXD7I
	 KofAc69YtGcMRPkNyKUub690srYVOT+wzHspmIyv/mqk4LoUYEqczN4gjJqBRWJMxIrBk
	 jNz2py58d+iBdGWjcEavCzqkK7/pvduRP369GQ2haCQKkOvh4/O5G6jFUHF9XSx1st3NE
	 oQUkBli1gGh5ahlV8nfFqa4yDm00M3foFSquwJTYkE6zmmj/TJIGasIvwQsoINxPcARFb
	 34QNd7g84mDoJWWeLo5omRhTSzCU3HIRVMuS2e1FrmwE7/dCWc3NZsvFNLkq6xPlOdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678912;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UgVlXRgVv5/x1DXWmVGKmIRruqBZ1ifqROjMLIcwpQI=;
	b=R4Ns1n2r0iKN2vQuNk4Cx1fZj+pdA1PEFid8ONfUt62jUj1ICqdjYBzJA+pTR8BXC635
	 7eqeZTFrMBtMfUG7CYSQLatehfs5jZb7E7cauTVIjazyAvrfuapXS9U2JDMX6Li4hch2A
	 KI11BsfiomiCLMORdrNMa+qBmRRphzUaA8cpIINkipIX0prP3MkxjugX2En3nyFEv2rxd
	 LQWyQ5eIMQ2CCsW4pJHQ7y6rJ3eB9Kw6pzaIDlSVzPqrgW0U6S5V/eqqZ+qUoU/FwDJYP
	 fBirvNQdRWMTCTHtA/62BRAZR1hbzZR3F7Pjod/haIrGz2A1LGt05vIpBLEw6GAvFLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dniXRB4Z;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CDA606A319
	for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 14:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21CDA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dniXRB4Z
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBCFC2C34;
	Thu, 22 Oct 2026 07:21:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3BA83F7B4;
	Thu, 22 Oct 2026 07:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792678910; bh=AjDgKxtJPU0cDSM8jjetpkKUyPIl0mcA2sgghiP/fy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dniXRB4ZD77Kv5qxyizSr8v8KtL/ukXit7rt6xFRKUWRWqRwmE6iH72fHbbiOthgT
	 t8pkLhHcMrKIjkL9hOIAKcTHcKAD8dALDouiCVdrInxKtCYCKPKtoN/P52CBgRrqBV
	 0dUXbOk3kfv9WFL09chD0AKAzIdjKVCTHS+KjbMo=
Date: Thu, 22 Oct 2026 15:21:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: will@kernel.org, mark.rutland@arm.com, chenhuacai@kernel.org,
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
	saravanak@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	zohar@linux.ibm.com, noodles@fb.com,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Roberto Sassu <roberto.sassu@huawei.com>
Subject: Re: [PATCH v2] kexec: Select ima_get/free_kexec_buffer() with
 CONFIG_HAVE_IMA_KEXEC(_OF)
Message-ID: <atob9ulCwxZgyWyL@arm.com>
References: <20261020083727.1906495-1-roberto.sassu@huaweicloud.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020083727.1906495-1-roberto.sassu@huaweicloud.com>

On Tue, Oct 20, 2026 at 10:37:27AM +0200, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> On x86, if CONFIG_OF_FLATTREE is enabled, the kernel uses the device tree
> implementation of ima_get/free_kexec_buffer(). However, x86 passes the IMA
> buffer location through setup_data, not through the device tree, so the
> buffer is never found and the IMA measurement list is not carried over
> across kexec.
> 
> Introduce CONFIG_HAVE_IMA_KEXEC_OF (which selects CONFIG_HAVE_IMA_KEXEC)
> and select it for the architectures that pass the IMA buffer location
> through the device tree, via of_kexec_alloc_and_setup_fdt() (arm64,
> powerpc and riscv). Build the device tree implementation of
> ima_get/free_kexec_buffer() only if the new option is enabled.
> 
> Select the new option also on LoongArch, to preserve the current behavior
> and avoid a link failure. LoongArch does not pass the buffer location to
> the next kernel yet; this will be addressed separately.
> 
> Finally, don't select it for x86, and use x86's own setup_data-based
> implementation regardless of CONFIG_OF_FLATTREE.
> 
> Fixes: b69a2afd5afc ("x86/kexec: Carry forward IMA measurement log on kexec")
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
