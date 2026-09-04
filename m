Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347583ADBA7
	for <loongarch@lists.linux.dev>; Fri,  4 Sep 2026 03:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491476; cv=none; b=XPqMn4p0VR+IrYgrN4mGHxQg7InEQdheBxbQhLPQiH/76L627RYj2YkJ5LsF3Xe/Hip5VYUu3mFHB4d6wSmMIAYc9NT3JOvY4rx4lI4t0bFmasIKUHoQfaehosbaL4jnCijyrPTfVu4mcKHCc2MXAcIrV4yVpuN2WSnOMAVzDbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491476; c=relaxed/simple;
	bh=nx/eitTR44C33VFjQT5eDwZTcChTpu7T7AIpTkNv5MY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUk1QR6EOgB79kU357VSlBJAOusUdjeWDc3PazrgvxOSQlNIAPn1d6Jd4cpvY8oXgBjQC+3RrkBbrHPKnYxogikcqV0Kfl83MeOXSvMxhZHcZOOaZi+/CotBHZH99ayjU4c0mSB61SGMC6VGDFUtGV4X/fekclkki8k+j7lgOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tIP0PUq1; arc=none smtp.client-ip=91.218.175.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tIP0PUq1"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=nx/eitTR44C33VFjQT5eDwZTcChTpu7T7AIpTkNv5MY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788491473; v=1; x=1789096273;
 b=tIP0PUq12dU0AdfeuLhKXHPIC7GZk4dQfvotWfPZjBVhXvOw9s3vCeHO6VIEy/icCoYZfTwR
 jvKIXO2+z2Bo2WERgsssEfGAAQc630iIfIsRCEpYLH1X02A0mhaRoiDxZS3UmiStPUSL3gy8sPR
 MphpGHrucCPQMo3EJPke+xHQ=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 946ef5c41bdd8706;
	Fri, 04 Sep 2026 03:11:12 +0000
X-Mizu-Trace-ID: 946ef5c41bdd8706
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	shuah@kernel.org,
	ardb@kernel.org
Cc: guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	liukexin@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 4/4] selftests/kho: add LoongArch vmtest support
Date: Fri,  4 Sep 2026 11:11:08 +0800
Message-ID: <20260904031108.11986-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807103714.33074-5-dongtai.guo@linux.dev>
References: <20260807103714.33074-5-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

While preparing v5, I retested the LoongArch vmtest without the explicit
`kho_scratch=16M,16M,16M` setting. That setting was masking a pre-existing
bug in the generic percentage-based KHO scratch sizing.

The percentage heuristic itself is reasonable, but the old implementation
calculated each per-node baseline after allocating the lowmem and global
scratch areas. Since memblock allocations are marked MEMBLOCK_RSRV_KERN,
those scratch areas were counted as new kernel demand and scaled again.

On the 1 GiB LoongArch guest, the 98.45 MiB reservation baseline and 32 MiB
alignment made the old ordering request 224 MiB of lowmem scratch followed
by 672 MiB for node 0. The node allocation failed and disabled KHO. I sent
a separate generic fix here:

  https://lore.kernel.org/loongarch/20260904025101.9959-1-dongtai.guo@linux.dev

With that fix, the total aligned request is 448 MiB and the LoongArch
vmtest passes using the default percentage-based sizing. I also ran the x86
KHO vmtest with the fix; it passes as well.

Therefore, I will remove `kho_scratch=16M,16M,16M` from loongarch.conf in
v5 so that it tests the default sizing path, matching the existing x86
selftest behavior.

Thanks,
George
