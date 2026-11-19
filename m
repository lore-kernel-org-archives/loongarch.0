Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092751;
	b=2QLoJtb2f9Phr2W/2s04LKPukt/V2wBYU6hNyNlNkSxija8hQIWfiffiCfU7Pj9mCJdn
	 IPMUeBjn0diDvxD1OMsGh1VFo2EItom9ms0gxclhwHi5APqkSj663L+l0tlYA57pnBqU4
	 XYaMgmUdjLm27hwJpRdNLToCmWvpPdQbqNKiVUPipG3iWWBt6K68Y1QptWTl0ZA9DT9U7
	 W83TCxqGoksxT4g0LjEi6kosz6rtkiBPhDQbU+FERzyovzVe46TA6T7j+x72W3aiuMAKf
	 P7ho4MmWyx7S7QvUq7Zs1CuT+uDrLFSKwpzfcI2cd5E6cGX5pDuIs6DkNAapsLJmp6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092751;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nOPSfl7MrQH3aAdmvuLmCg2r2GTpQs9P2IrkXtthaEg=;
	b=RPMUQ94f82BueVYpeye7PEkHVC88jBcSXuukxTUY3qtDQW8PAYYxJlRH+q7MVZ+slPwI
	 rdzngVwkBddIFYTJJhGeQYFSiPt9a1kLbDIHEej5Ffbg3rgRq96yWjmjBimZOAit/aG1J
	 pue79tlR9CDKKGC4/3yQ8RMhxbjg6b+2rw8Jm31SMMniHiCP7Q1XEIRFhk75QO1X63GgC
	 JAU81cfx8B5le7FID9nHoesG8geGajtxSej7D8yQ8Zmr9Xd0hZs1ZUW/HGtz75nW80Tlx
	 b1X0NN0y/hAz4aual3QF/NqfC/hBG8J0UlRmZkCQvFgdHCGKvhY4JkvZ0dcy5tdPn/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="GcxX/XWM";
	arc=none smtp.remote-ip=95.215.58.54
Received: from mta1.migadu.com (out-54.mta1.migadu.com [95.215.58.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45ED606A324
	for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 12:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45ED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GcxX/XWM
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=nOPSfl7MrQH3aAdmvuLmCg2r2GTpQs9P2IrkXtthaEg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795092747; v=1; x=1795697547;
 b=GcxX/XWMeZeuTZblPzOCtHls2XYIzke8Wax5r/ZTDw01/8E0Ew5c+J5EUDAe6wPJ+SBNgxO2
 W1IO25VH7eI9UG4Pun7lF/zTewsf0Qe0eTP3N9GVUTCSBNSFInYGMP0Cpy0Rrh4x5KPEFMc63FB
 jGN0iSoqJ4DjznvX+zMivyik=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c26360b5cbcdfa14;
	Thu, 19 Nov 2026 12:52:27 +0000
X-Mizu-Trace-ID: c26360b5cbcdfa14
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	rppt@kernel.org,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Allow memblock arrays to resize
Date: Thu, 19 Nov 2026 21:52:21 +0900
Message-ID: <20261119125221.11897-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAAhV-H4pmcV8hah8sPyQn3nR9cO-NwkXMPLeSABAO-VEnS08fg@mail.gmail.com>
References: <CAAhV-H4pmcV8hah8sPyQn3nR9cO-NwkXMPLeSABAO-VEnS08fg@mail.gmail.com>
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

Hi Huacai,

On Thu, Nov 19, 2026 at 8:05 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> Would you mind if I move it between memblock_dump_all() and
> memblock_set_bottom_up(false)?

Not at all, please go ahead. KHO still works with it there, since
kho_memory_init() runs after setup_arch().

Thanks,
George
