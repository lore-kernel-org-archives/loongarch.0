Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701788;
	b=fKJX7LEYPeIldPUswKiHptUoQuNM92cq7Bm/h16gn8mYUYcmSmOP7iPj9+fXclEuqDHt
	 ta8GIfAeoi2oci9XCXB0JbV2FsgTo9KjoP88jWiA+HjFcLtCIK0Ftz4Ehe0lAfnGMjV1x
	 +8LtknsgwPntq18UklPH6ZUL/nBHYZxgiyLiRVGHtltNohSV9si9z2PI4UHBunvvlVdqS
	 +6LZroR0vxzvKYVYcife3bwXDxpcE6Ls7mT+QrBq/R3h8EuNrX4hCDClA8qg6BJR42rcB
	 Ra01sj5b+c0tI8C1hl5y3ERHiIm+IJrOT03zWRfpGqxj4C5KQ68fU53cbwSF9co3DLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701788;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9OSvScGRwha8A7Tb2tHR3R5F02sXRmMamVkr8+PRTWs=;
	b=25BtNcdUqea7U7K0RMv2W+jLo+2FgI26rGePlaWcnhpNjg/S3hqJmMN/CWfJGYPaCFfH
	 Hl5d4MAtE9Z3J5ObbETbamCfzsmBnFd4IqdDMSeQ3hdRdi+FOsSP8Tg5Eh/3UaBqL7djh
	 MKruMVVWUg6qFJni3vjJ6vLLaRF78kvcLv6uo8o3B4Tnyo7lYcHwgjR1lZwfWWdluspgk
	 N9uTYgjDgewHLP68fP0T6VFy1mgKs91ZRTdEl/P5jOPQxhqm2Nt5+c7CE8OmOgYWSt315
	 rR1QBSFDixe+8H3b+SHzaAQvRDFVl56UtX2OCTG0KnLfW9Op/+C7lLU568j5Z9G5DGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QQ1qfgqU;
	arc=none smtp.remote-ip=95.215.58.113
Received: from mta1.migadu.com (out-113.mta1.migadu.com [95.215.58.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A3A606B12E
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 10:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A3A606B12E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QQ1qfgqU
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=9OSvScGRwha8A7Tb2tHR3R5F02sXRmMamVkr8+PRTWs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793701785; v=1; x=1794306585;
 b=QQ1qfgqUbGhGBerxeLuJhyNk7bgr29IpB6mdUWq7I5GBjwVxZyy1/52gPaY/7kXtM0GXHLCx
 4RpcT2uiJ1ar4EFiI4YDe8tiB1L5f3BVfM1Orm01rf7eF0WUMSfamObsQPcMPJ6r1YAuC3tWkmp
 0vu1Vhi7wZbuoThW/OWjzw8w=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 129eb9b76a2afe71;
	Tue, 03 Nov 2026 10:29:45 +0000
X-Mizu-Trace-ID: 129eb9b76a2afe71
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: ardb@kernel.org,
	pratyush@kernel.org
Cc: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	chenhuacai@kernel.org,
	shuah@kernel.org,
	ilias.apalodimas@linaro.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	ruirui.yang@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	liukexin@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH v6 1/8] efi: Pass KHO state to the next kernel in a configuration table
Date: Tue,  3 Nov 2026 19:29:41 +0900
Message-ID: <20261103102941.11087-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2382a0ee-cb6d-4572-be6e-ce3cf4d006e5@app.fastmail.com>
References: <2382a0ee-cb6d-4572-be6e-ce3cf4d006e5@app.fastmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ard, Pratyush,

On Thu, Oct 29 2026, Ard Biesheuvel wrote:
> Can we handle this as an arch table then, and handle everything in
> the LoongArch arch code?

Ard, LoongArch is currently the only user, so I understand the suggestion
to keep the handling in the architecture code.

My preference is to keep the table definition and handling common, given
the potential for x86 to use it as Pratyush described in his reply, to
replace setup_data once x86 gains EFI support. The table contains no
LoongArch-specific fields, and only the LoongArch stub installs it. On
systems without the table, the common code does nothing.

Would that be acceptable, or would you prefer to keep the handling in
LoongArch until a second architecture adopts it?

Thanks,
George
