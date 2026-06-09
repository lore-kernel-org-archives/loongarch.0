Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EF0343D7B
	for <loongarch@lists.linux.dev>; Tue,  9 Jun 2026 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016014; cv=none; b=muafxQIJYC8jMbHaeGJb8LAxDzvPoHZsMA6E+UDsPupLM4gK9mwvCsF82hbItkh6FQLwL+spBKGOjIZlbnNjEUMoNIRAruFe5xpFpMV1/6rGnuum3ta+swpB83RLZE8/fAMe49/DgY19O6VhEHUnc3Ux8gdNlUF2GGdKKv6/tZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016014; c=relaxed/simple;
	bh=Fmac61i2dwLocCOx7qcTqnbQ43RtfTqLMELLfckgZ38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FILknd1paJxXMiKnKsi8cWMT7wyhptKX7ThzBeANUoJ9vVof9Wo3kIm2+4RnWXwVhKIGeg9+uQQv14xlOx6oaw1XacCsHGqCFyLnnz0iF8/uXL58QqLjvvKXzkk69DGlwYmpX7Y6UIH8DdKBh91KQhatD4GIo3RSNaZOYcufq5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NWYFODOC; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NWYFODOC"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781016011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fmac61i2dwLocCOx7qcTqnbQ43RtfTqLMELLfckgZ38=;
	b=NWYFODOC/z8fN1av0PD2atwJekgdJSlGgtsB7NkKlRnF+0qjL4q6Mu8Wxh0l/VpAyWI8Zt
	Wy6iYczj3eNFCiaIiYg086C5pcDhiihOM+vqBWNagn7Xutgpmko9Ki/FPS+q/j6qsFd4B0
	5nvk5YbJG7OOEMyRaZiGQYmTY2xkTNs=
From: George Guo <dongtai.guo@linux.dev>
To: Mike Rapoport <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Alexander Graf <graf@amazon.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: Re: [PATCH v3 0/3] LoongArch: add KHO support and selftests
Date: Tue,  9 Jun 2026 22:39:45 +0800
Message-Id: <20260609143945.512688-1-dongtai.guo@linux.dev>
In-Reply-To: <20260601092823.110362-1-dongtai.guo@linux.dev>
References: <20260601092823.110362-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Mike, Huacai,

Gentle ping on this v3. In the v2 review you mentioned you'd wait for
v3 for a more detailed look -- v3 addresses both points (folded the two
selftest patches into one, and replaced the LoongArch-specific kill
loop with timeout(1), with the timeout value set per-arch in the conf).

No rush, just making sure it didn't slip through the cracks. Happy to
spin a rebase if it's gone stale.

Thanks!

--
George
