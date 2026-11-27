Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794064;
	b=oSlFuoa4PI4+1td6x41smLzVb9rzqVU5b7QyZlO9glwcgZi/NXz9Ji0sXl5WfOJy4e8e
	 /bY1DkvWPzCDt7KzKP8EHWGss67u8SK0q9krbP6ZIV2n1rvQwAilybeEw7UyeDB8ucxgk
	 7CPOm6yyZiQbOObRzIG1vqUJJHMi8sVhtPWjDLBSIxPGa9y5r9i4l29DLQcpZGTVExhBD
	 spgncRMuUX02UB3z7yqST+iZxqqzVTY8aHHe3T+10zOFqU8qmeg4fLU+pF59hY5aUmHrm
	 y9oG4T+MerTFAor9w03I1E1f7b1ccJPJH2djN7G2JCDpiFXvzHbXYFlEuwEUuNmwmbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794064;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zTeGEeYubIuGfiie/NnBel4Xijl6Dj7t6gEULam6Lc8=;
	b=tKqUPV5KM1CVmqDAaao8jiK1uOFwjYYwNoqbUoILoawYBvkuC6Km/qMID5OMzaGMIRxv
	 EyfgH/BJNVmQRFDCfQuhbciFX9tZLp9AD5Dq4blGE0YgxsMNDrb0p8vl8gzr8kBOj4SW/
	 NjjRI22Ktlz521HwOaZ4EHYKD3nyUH7VxeKzEvgAQ76HxISnKZGEc2CVQ34JNnGwJCw9c
	 xAgZMjxd8g8EIy9FSEqhmkzPZ5R5ptrWZnKkRYA6SiQohWw5T3RtjcqXgpsjLl0Dexg3b
	 RB4jOgutt761rP6Tw2JAPoaH8lYyi27yT7V+QoN2uySTQk36GrIwID1CADS0gJvo0wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cJOpl0D5;
	arc=none smtp.remote-ip=91.218.175.232
Received: from mta0.migadu.com (out-232.mta0.migadu.com [91.218.175.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F241F606A31F
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 15:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F241F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cJOpl0D5
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=D7LzFkhrlPQer8Lrs7O6LLemqF5OXFeGJoFOpPJ4gPo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795794062; v=1; x=1796398862;
 b=cJOpl0D5OSfcQqez6bcfCZyocvBCdviNPMu7xXzrW3rxCi7bGixjVd73vMe5JMKb3B+H+luq
 W5mo8RtX8Cg6oQ5YDJre4nAUcjgffv4gqoHS+0UQAqQd3i1s594vnGrVvLROCT//DI3K3N6MCGM
 3zX7oZhRG9SWzVc7yRHgi3kQ=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 944c59f8ed2ff705;
	Fri, 27 Nov 2026 15:41:01 +0000
X-Mizu-Trace-ID: 944c59f8ed2ff705
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: mpilaniy@redhat.com
Cc: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	chenhuacai@kernel.org,
	ardb@kernel.org,
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
Date: Fri, 27 Nov 2026 07:40:54 -0800
Message-ID: <20261127154054.43755-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <99670aa8-a33c-4a36-b8dd-66b02c6b6159@redhat.com>
References: <99670aa8-a33c-4a36-b8dd-66b02c6b6159@redhat.com>
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

Hi Mukesh,

Thanks for the review, and sorry for the slow reply.

On 2026/11/4 20:24, Mukesh Pilaniya wrote:
>> +			pr_warn("Could not map UEFI KHO table!\n");
> This is a Linux EFI configuration table, not a __UEFI KHO table__, so
> IMHO; UEFI wording is wrong here.

Agreed. v7 changes it to:

	pr_warn("Could not map KHO config table!\n");

>> +	if (status != EFI_SUCCESS)
>> +		efi_err("Failed to install KHO config table!\n");
> When install_configuration_table fails, the pool allocation made
> just above using efi_bs_callis never freed, so a page of
> EFI_LOADER_DATA is leaked until ExitBootServices, This is a minor leak
> so mentioned here for review completeness.

Will fix in v7. The pool is freed when the install fails:

	if (status != EFI_SUCCESS) {
		efi_err("Failed to install KHO config table!\n");
		efi_bs_call(free_pool, kho);
	}

>> + * The EFI stub installs this table zeroed on a cold boot. It stays
>> + * in place across kexec; the running kernel rewrites it just before
>> + * each kexec, and the next kernel reads it during early boot.
> This statement is only true for the LoongArch and on arm64/riscv/x86 no
> table exists, so the comment describes a kernel-wide invariant that does
> not hold.

Right. I don't want to name only LoongArch here, because x86 is
expected to use the same table in a follow-up series. v7 rewords it
as:

 * Only installed by the EFI stub of architectures that pass KHO state
 * this way (currently LoongArch); elsewhere the table does not exist.
 * The stub installs it zeroed on a cold boot. It stays in place across
 * kexec; the running kernel rewrites it just before each kexec, and the
 * next kernel reads it during early boot.

Thanks,
George
