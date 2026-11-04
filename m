Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823297;
	b=M62otfUIdqzeLlOgcfFKr8jn2gAvQ2aydeZhdQcIULN0jX0IvEEk2aUK8Cp0TO/9UmXl
	 Ov/CI37T9QVF4+qWyFnsnDRw2//aU01OXBulsz1G3XmByO00jUe3JxgSi22z3YkFLyGPc
	 MPLMnjV9STAvJVfC6LkWg76x6o9KIaH0y/dVObbQbgM7AdJgtaQlV6lp00A/Z/ANyc+bs
	 utjuYSZeR80XxtXaAEvHnkOkl7dbC4eZYJAJu2cetpCZuiagFoYoKdBIJY++IG0BFU0Oi
	 7kX7rCwp+Wl8W/Yy2JAo1+veyb+baY6c+u2p7qvXz3J3n2U8JyUg+caOiHkt+0xZ0GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:
	 In-Reply-To:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=AS/luxCxZZ4IKfwOyJu4Ue765u+vBG+6P6QAZr4AiP8=;
	b=u5Hz38xGMvMiZKR1erGEw3TU3n9UDDEUd6yGblM8Y9cUgqdaF3Bgr0Z+TbPFTnAILwlr
	 rT1NYMWoN2qN3Q68IRdJHZs5Yb2aX9I7KuoE4lz9VUbfY/n94m42gdzjr0Uk9+meOYOJT
	 KhtvgcXeKO0qXCxn8mzHHHLyUkyQM/skRzhgeTgp7EONUmllrOvQscyVarCO+LLsTS2W4
	 gw8h4o0IR4VzBra3hHJqZB6BhUSl77xdTu8lXgPUKNeiTQgLVgCjZg2VDDK1qS0QfL6Bl
	 7b/2KIUOD5aQFm55gjpsfwgVJzLCSlpIZkYzJcYl0oJBfLb9dzGlwPJDaGOrE4SFVLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jeffxu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bec2Xgmh;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AE60841B8
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 20:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 389AE60841B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jeffxu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bec2Xgmh
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso772510eec.0
        for <loongarch@lists.linux.dev>; Wed, 04 Nov 2026 12:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793823296; x=1794428096; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AS/luxCxZZ4IKfwOyJu4Ue765u+vBG+6P6QAZr4AiP8=;
        b=bec2XgmhEZBjJm69ICq0QlPBn1QSww+6o56/8AWfvn64HyLwyfHCTN4TtsLaEU0q3e
         8E/d4f0tTG8lVIIFM2aMtDxMycuw3j7GBB3bi/CrphMJP2FDgMGlnQfoWE3JNyuBZOlT
         zGpKgtfU0t00+C9WJtlmxMjq6IiVITAf5dsaCExqfWKOBgXUgaNqwS2HGRVoVzY1v+ol
         1gISviHcE7IzpTotBJ5OfsQzl1dL2LJZ0gCmSRtGxvFzBLd03t1DCS7hB8WHawYSx9IC
         Mm0Ncqgb71/il2yHG5vJFa35fR4PR5ge4g+afT+GygvTZ7RX16cEenzqK2bT/aHr9OGT
         daLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823296; x=1794428096;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AS/luxCxZZ4IKfwOyJu4Ue765u+vBG+6P6QAZr4AiP8=;
        b=HdJo1J5R9yiZxAaLoUBUyGMn0pqEGgb+Imjoiyfoz09OAw4Vw9FzQjvZhnTEyO0k9z
         vDon0RCFtrZRKWng9TNTZ8bQp80sh8mMZFJm1aLRSFm18tKW0D+kUGNx/luUM4ldBs7P
         EQ+MTk7wqK4SFA26fckOKzRYkwrlIUodDNhrUthUcnf85ik3aZxLLCTu5SboHjPVekRQ
         Tnd7OXmnu3cAEUWARWHZwCDNyMXD/BytCg3swTKV0e4L1Mhjv1Vo/+D/UrAuLpvDy5rx
         wyx7wxdcuE/Rlwmmw0z5suA5EjWK9EuS5ZLTX22GZx3vUlNmr6ZD1KetRX09A9Xai3ww
         Tj+w==
X-Forwarded-Encrypted: i=1; AKwUvBx/+UdfKEhKA0ZaWnRsb1wa6iV2enk+zc6cR24YTyPOw77xcDAn4UJXQDIewHgXLmZ2jAXASFREec8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8cTRaGOD5jZmNeJ9vsD33noLacp3c+1hPToLh4JAnYoBzw+vtM
	MFd6YNKsezWJpPqRNv5RaZsPBlx176oszzFYkOwQLBA+4nhJdXDpKdb+5W98SsVwZKvUfo0Glxb
	1ZKR1GQ==
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: from dybkf8.prod.google.com ([2002:a05:7301:3a88:b0:36a:e67:fbc2])
 (user=jeffxu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1608:b0:185:4ad4:3d15
 with SMTP id a92af1059eb24-1ac56302329mr19203878c88.1.1793823295901; Wed, 04
 Nov 2026 12:14:55 -0800 (PST)
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
Message-ID: <18e4f0c895c8d2ed.3137322e32382e342e3434.27cc5b.0000sendgmr@google.com>
Date: Wed, 04 Nov 2026 20:14:55 +0000
Subject: Re: [PATCH v2 0/8] mseal sysmap: Choose system mapping sealing at boot
From: Jeff Xu <jeffxu@google.com>
To: Chris Down <chris@chrisdown.name>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Kees Cook <kees@kernel.org>, Andrey Vagin <avagin@gmail.com>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Shuah Khan <shuah@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-mm@kvack.org, linux-hardening@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On Tue, Nov 3, 2026 at 11:17:43PM +0800, Chris Down wrote:
> System mapping sealing is currently a build time choice. Hosts which
> want it and hosts which need to move or unmap these mappings therefore
> need separate kernels, which is not ideal. Let's allow the administrator
> to choose at boot time.

Thanks Chris for the updates and for adding the unsealed boot parameter
test coverage! The v2 series looks good to me.

Reviewed-by: Jeff Xu <jeffxu@google.com>
