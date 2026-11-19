Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076580;
	b=HEfqUYbN5AIk6vemxQ7Hs+JmTywHD13v9rx4RZF5t7HPWmFpwMbqjcphGivkFvVMTd6M
	 5H0kvgKm3b+5nRqosuanO3O+H9GRq2P+b7BULt/JgMummCw6Pmeepisxwy6CQxid4ybPb
	 ze4YPmOYjGWoI5+9yPcuwXETXPGv90N/84OFpexbjGPF7jA0mL7SEPaYvJLUvE4tQOcWu
	 gBWFNRJi9car/LOrawL+TPwdRZlrJia6Dfa57nMvemPFyuw/LihBURnYt2kgIGAlfEncG
	 hSJdd/NlyM94Vt168rUHlIhNmRhrFv17DHsKpOBofJ04KrREb3MWN3KrP4ciYaupmrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076580;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9xtLTQESNoyZANIpHgUGyLeoukqSPARphk8aXo+VHwE=;
	b=RTLxMh7np1zCd0YR+UoeH/8b72T417juvCVNcfh1w0Pjv5k8TC8kg2CRHoBzE4oW/FYL
	 ZbvWYh4CLz8Yal1oxdtZy/VGo/wPGWlnENyQTgzl8VHS+UBM/qR6boc7ZtHBHnbmpMSX0
	 WC268OboF1iGji6XRrVQbwwdCDXom7Xv65Gnk/nQ/FuM3AjdMTaBEqAkQxd2W0EvuCbS1
	 AnV6n+zp8ab340VfGGMWhGzvYIl18Obf9HIUkmzBJk8byoxhzVRQ4AoYtrMCfIEBbXrRH
	 5KKLR9FPMF6Gt1M1X1CCOuyrpEYqda6lFqhPpsHZyZL3jZzZp0PoYJ14eutsfODwPkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="TLtOz3/V";
	arc=none smtp.remote-ip=95.215.58.30
Received: from mta1.migadu.com (out-30.mta1.migadu.com [95.215.58.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6D1606A325
	for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 08:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6D1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TLtOz3/V
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=v7j+so0A9nPKyNFG/7i7Z4Ia8f3AlnUzgV4OZVQCLNk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795076577; v=1; x=1795681377;
 b=TLtOz3/Vwuj2oRnKgQShgwM2JXmHAm/33S/i82MEq1IycE+UakLvzLvRpgvUdIVIZ0BHoC8l
 Akr2G97MGgshl1tAB1+QvcUIremLvLiFkC4ETGpEHGZ+DwWlMmW7F3ywhbnde1jS4mbSipLh4lc
 vXrUVH6O539xox5E6fdKLvsI=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 09da8324dc43e42a;
	Thu, 19 Nov 2026 08:22:57 +0000
X-Mizu-Trace-ID: 09da8324dc43e42a
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	ardb@kernel.org,
	pratyush@kernel.org
Cc: rppt@kernel.org,
	pasha.tatashin@soleen.com,
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
Date: Thu, 19 Nov 2026 17:22:52 +0900
Message-ID: <20261119082252.9120-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAAhV-H5Vse=pKC3Beqhqxa7fqadiGVNqkSy_06HZ3Luw2Pmj5Q@mail.gmail.com>
References: <CAAhV-H5Vse=pKC3Beqhqxa7fqadiGVNqkSy_06HZ3Luw2Pmj5Q@mail.gmail.com>
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

Hi Huacai, Ard, Pratyush,

On Wed, Nov 04 2026, Huacai Chen wrote:
> I prefer to keep it in LoongArch until a second architecture, and I
> think Ard is the same. But this is not a strong objection to Pratyush.

Kexin Liu and I have tried x86 as the second user, to see whether the
common table holds up. It needed only small changes:

- The x86 EFI stub installs the table, as the LoongArch stub does.
  install_kho_table() moves from efi-stub.c to efi-stub-helper.c so
  that the x86 stub can call it.

- kexec_file_load() skips the SETUP_KEXEC_KHO record when the table
  exists and the next kernel will get efi_info. Otherwise, for example
  on a legacy BIOS boot or with noefi, it falls back to setup_data.

- When there is no SETUP_KEXEC_KHO record, the decompressor's KASLR
  code looks up the KHO bootmem areas in the table, so the kernel is
  not decompressed onto preserved memory.

The table layout did not change. The only change to the common code is
that efi_kho_table_found() is no longer __init, since x86 calls it at
kexec load time.

Tested in QEMU on x86_64. With OVMF, the KHO vmtest and
luo_kexec_simple pass, and the second kernel finds the KHO state
through the table. With SeaBIOS, the KHO vmtest passes through
setup_data.

So I would like to keep the table common in v7. Would you prefer the
x86 patches in the same series, so that the generic code comes with a
second user, or as a separate series on top?

Pratyush, does this match what you had in mind for x86?

Thanks,
George
