Received: from mail.envs.net (mail.envs.net [157.180.15.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EDD1CFBA
	for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 02:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.15.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776045940; cv=none; b=NXSt+O5ApMud6alZ5jvbYxVSXE9wlpCtoY/rjHbUao9+HeTcimByPPRI8XxIAo8w2dtfgTI/1oonTZuUXpw9N/Yxq5RG2TOK1Lh7DL3FB8wscq5u5q00LgUWUgoUJOapDN+f2BGznyxAmWiLCPUOZKNx9scNjReSbYPoC3VVEws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776045940; c=relaxed/simple;
	bh=SnbHAobkQmOdD4TXDbAeAcRyxMt6vfBSkx7DgZ5dZYM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID:
	 References:In-Reply-To; b=Vat54br0mzxvLWnCtboLzqO3ffDhuKP92thpcO9Yk8iWW5JagApOQLvW9u/8BalNXtSRctvrOsrCd4Y6e+2NCLDM4JYJts6aRh1gCz97fuJ701cCUJKJkTtduRz/+wtsbGEvO1iKJ9ULA2LNPShlHzpJDRyaQE7AwnKE7o7NpRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=cuiqh4iO; arc=none smtp.client-ip=157.180.15.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="cuiqh4iO"
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id DF8221C00CC;
	Mon, 13 Apr 2026 02:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1776045934; bh=YvF1kw3b/r0OeHsZoIjDXuEBKtohoXiGA3Lcd4AU+SM=;
	h=Subject:From:To:Cc:Date:References:In-Reply-To:From;
	b=cuiqh4iOeXrLY2c6FGfqOXZuEEmevnvR24rLnWXnXZ4LBOz0odsK9CT+rxQG/3KAO
	 NMnAaVtkbezRbZ3dDUS3iu8+O/bRTikDwDFpf3miYTw7ruWckewih6O2vIpEpYI2QB
	 IZ1SqGNQQyNS+tOIdxS+d2JWIIrS7hqLu3HWnfPu8E8/zBnWtdOoX66wm9CRZK1Kii
	 f7gFvfIiqx+ssR3S+OuAvCFXY9gIlwrCsHGSO6N3ScXcWwPUs8ND3DdBQuFMzzc/AN
	 9SXTQyH4x3ZeoXI9SePsSbr4YAtRbemPpfklC299GPTaN/6m0tYbI92z0WUPm2X6vU
	 quxxhyEq5ZuB1Qygf7RchCNCXDpj/XandXTPWki+bh2IQ7lF/HjeP7fq6+0Yk9IMSH
	 Ci+WrYjaf9dBHTfXIGjN1rHTJO/27qQ5j72cRB+5Ytc/hlprTg8YywwqQsntzhJj/T
	 Jw41OTyuvQHY/CZx0arXgTER9PNED2BeHjfU5nNUgBHcOIBn6UA7Cs99ckEYzDn/xS
	 yK9zpoA6ZlJ5oVYIPq7CK+VAsm5OTddcvNPdXc06r6rUHWOaC1orHaotYF3mBiGPMn
	 Pl6VgKgjGE2y5+z7qurM74wdei5djPtewwqL0cKIfeWCQy8z/xynPncM8nXNhSeoMl
	 VMb5kQBF2lvZPTFOqZ4NsxGg=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BHP7SLDqFX2l; Mon, 13 Apr 2026 02:05:26 +0000 (UTC)
Received: from mail.envs.net (mail.envs.net [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Mon, 13 Apr 2026 02:05:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] LoongArch: Increase default mmap randomization bits
From: "xtex" <xtex@envs.net>
To: xry111@xry111.site
Cc: chenhuacai@kernel.org, kernel@xen0n.name, guoren@kernel.org,
 jiaxun.yang@flygoat.com, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, xtex@astrafall.org
Date: Mon, 13 Apr 2026 02:05:26 -0000
Message-ID: <177604592650.1255.8930268562622890190@mail.envs.net>
User-Agent: Modoboa 2.2.4
References: <b04efb5af4f5019adbb0adb8543bd84b8157e8e1.camel@xry111.site>
In-Reply-To: <b04efb5af4f5019adbb0adb8543bd84b8157e8e1.camel@xry111.site>

Xi Ruoyao <xry111@xry111.site> wrote:
>On Sun, 2026-04-12 at 20:32 +0800, Xi Ruoyao wrote:
>&gt; On Sun, 2026-04-12 at 20:24 +0800, Huacai Chen wrote:
>&gt; &gt; On Sun, Apr 12, 2026 at 11:49 AM Bingwu Zhang &lt;xtex@envs.net&gt; wrote:
>&gt; &gt; &gt; 
>&gt; &gt; &gt; On Sunday, March 29, 2026 11:48:02 AM China Standard Time Huacai
>&gt; &gt; &gt; Chen wrote:
>&gt; &gt; &gt; &gt; Hi, Bingwu,
>&gt; &gt; &gt; &gt; 
>&gt; &gt; &gt; &gt; On Sun, Mar 29, 2026 at 6:59 AM Bingwu Zhang &lt;xtex@envs.net&gt;
>&gt; &gt; &gt; &gt; wrote:
>&gt; &gt; &gt; &gt; &gt; From: Bingwu Zhang &lt;xtex@astrafall.org&gt;
>&gt; &gt; &gt; &gt; &gt; 
>&gt; &gt; &gt; &gt; &gt; Increase default mmap randomization bits from 12 to 18 on 64-
>&gt; &gt; &gt; &gt; &gt; bit
>&gt; &gt; &gt; &gt; &gt; platforms for better strength.
>&gt; &gt; &gt; &gt; &gt; 
>&gt; &gt; &gt; &gt; &gt; The original default, 12, means that ASLR offset has only (1
>&gt; &gt; &gt; &gt; &gt; &lt;&lt; 12) =
>&gt; &gt; &gt; &gt; &gt; 4096 possibilities. On average, it can be brute-forced in 2048
>&gt; &gt; &gt; &gt; &gt; attempts.
>&gt; &gt; &gt; &gt; &gt; If a service is configured to restart automatically or can be
>&gt; &gt; &gt; &gt; &gt; started
>&gt; &gt; &gt; &gt; &gt; easily (e.g. execve a suid program), then trying for 4k times
>&gt; &gt; &gt; &gt; &gt; can be
>&gt; &gt; &gt; &gt; &gt; done in one day even when each attempt takes 20s.
>&gt; &gt; &gt; &gt; &gt; Increasing it to 18 makes brute-force much more difficult and
>&gt; &gt; &gt; &gt; &gt; leaves
>&gt; &gt; &gt; &gt; &gt; more time for operators to find out attacks.
>&gt; &gt; &gt; &gt; &gt; 
>&gt; &gt; &gt; &gt; &gt; On 64-bit platforms, virtual address space is cheap, so the
>&gt; &gt; &gt; &gt; &gt; randomization bits can be increased safely without disturbing
>&gt; &gt; &gt; &gt; &gt; userland
>&gt; &gt; &gt; &gt; &gt; much and security comes first instead of availability.
>&gt; &gt; &gt; &gt; 
>&gt; &gt; &gt; &gt; Don&#x27;t change ARCH_MMAP_RND_BITS_MIN because it may compact
>&gt; &gt; &gt; &gt; performance, and you cannot blindly increase
>&gt; &gt; &gt; &gt; ARCH_MMAP_RND_BITS_MAX
>&gt; &gt; &gt; &gt; because it should no more than &quot;VA_BITS - PAGE_SHIFT - 3&quot; (see
>&gt; &gt; &gt; &gt; arch/riscv/Kconfig and arch/csky/Kconfig). For LoongArch,
>&gt; &gt; &gt; &gt; VA_BITS can
>&gt; &gt; &gt; &gt; be 39 (half of VA40), PAGE_SHIFT can be 16 (64KB page), so
>&gt; &gt; &gt; &gt; ARCH_MMAP_RND_BITS_MAX can only increase up to 20 (39 - 16 - 3
>&gt; &gt; &gt; &gt; =20).
>&gt; &gt; &gt; 
>&gt; &gt; &gt; Sorry for the late reply.
>&gt; &gt; &gt; 
>&gt; &gt; &gt; It was my mistake that I didn&#x27;t notice the upper bound of MAX.
>&gt; &gt; &gt; Thank you for
>&gt; &gt; &gt; pointing out!
>&gt; &gt; &gt; 
>&gt; &gt; &gt; However, I didn&#x27;t get where increasing MIN could compact
>&gt; &gt; &gt; performance.
>&gt; &gt; &gt; Theoretically, the only difference is that the gap between heaps
>&gt; &gt; &gt; and stacks
>&gt; &gt; &gt; are larger, from [128, 128+64]M to [128, 128+4096]M. This
>&gt; &gt; &gt; shouldn&#x27;t affect
>&gt; &gt; &gt; performance much. MIPS once used MIN=16, RISC-V 64 and PowerPC and
>&gt; &gt; &gt; ARM 64 are
>&gt; &gt; &gt; using 18, and x86-64 is using 28, but I hadn&#x27;t heard anyone
>&gt; &gt; &gt; complaining about
>&gt; &gt; &gt; the performance.
>&gt; &gt; &gt; 
>&gt; &gt; &gt; I ran some benchmarks last weekend using the LLVM build benchmark
>&gt; &gt; &gt; of AOSC OS
>&gt; &gt; &gt; https://github.com/AOSC-Dev/buildbot-benchmark/blob/master/buildbot-benchmark.bash
>&gt; &gt; &gt; and here are the results
>&gt; &gt; &gt; 
>&gt; &gt; &gt; Processor       Rand bits       Time/secs
>&gt; &gt; &gt; Average Variance        Range
>&gt; &gt; &gt; 3C6000/S        18      612.927 614.394 614.513 613.343 614.76
>&gt; &gt; &gt; 613.9874        0.515637840000006       1.83299999999997
>&gt; &gt; &gt; 3C6000/S        12      614.322 613.93  614.825 613.859
>&gt; &gt; &gt; 615.875 614.5622        0.548874160000007       2.01599999999996
>&gt; &gt; &gt; 3A5000  18      3547.165        3548.764        3552.192       
>&gt; &gt; &gt; 3545.697
>&gt; &gt; &gt; 3547.567        3548.277        4.79228759999993       
>&gt; &gt; &gt; 6.49499999999989
>&gt; &gt; &gt; 3A5000  12      3549.029        3551.894        3549.191       
>&gt; &gt; &gt; 3567.869
>&gt; &gt; &gt; 3587.409        3561.0784       222.052853440003       
>&gt; &gt; &gt; 38.3800000000001
>&gt; &gt; &gt; 
>&gt; &gt; &gt; I didn&#x27;t see any statistically meaningful performance defect.
>&gt; &gt; OK, then we can increase ARCH_MMAP_RND_BITS_MIN, but the range 18~20
>&gt; &gt; seems too small and then useless, can we consider using 15~20?
>&gt; 
>&gt; IMO ARCH_MMAP_RND_BITS_MIN should be just the minimal that the
>&gt; architecture can support, not related to security.  If you want to
>&gt; recommend a value for increasing security you&#x27;d set
>&gt; ARCH_MMAP_RND_BITS_DEFAULT a larger value instead.

okay, I agree to abandon this patch. But,
Isn't the minimum supported value 0 (i.e. mmap ASLR disabled)? There is always a fixed 128M gap between heaps and stack tops so 0 should work.

>
>I.e. for example if someone is building a distro running on an embedded
>system where avoiding addr space fragmentation is more important than
>security we shouldn&#x27;t be stopping him to decrease ARCH_MMAP_RND_BITS
>unless he reaches the architecture minimum.  Instead we should increase
>ARCH_MMAP_RND_BITS_DEFAULT so the &quot;typical&quot; systems get a larger
>ARCH_MMAP_RND_BITS.

Is address space fragmentation that important on embedded systems? Isn't it obvious that you will never have 300G RAM on embedded systems?

>
>-- 
>Xi Ruoyao &lt;xry111@xry111.site&gt;

Bingwu Zhang
