Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C218346985D;
	Mon, 21 Sep 2026 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982367; cv=none; b=cOPzMDJqGwNW7Bgp83aC5hTIcHGBlIz364ooagYkWcRAcI3GWtlP+yjxpnZkJNAdYWzmjIqUSNWW4uIXfyz2ZpmUXYmlZ56XWw4rRoN2wGK1OGvqbdDfNjQlz1nBuk04nSROCglm0GgTq8tyzsctXmHwLwlu2ZrTGlWaSeJq5pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982367; c=relaxed/simple;
	bh=R3VWhm5DK1BFR53HtMU+M8vTk1Nt5oNf8CDsE/3Y3vo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ACPjplQtk1wxDZRlxPu8cmYiF8MjO69OThW41cLv20c5qGVts35StrOgg6eeEF4REpMVP1TO6Np5LwLw29EhPD3G379DRlIy0kquCjTSx5aJwC3YWq+iYWQOh8EXfMk8PST3H5iGuZZnqrP9Bzy9puDmlVlh/LhzH+Fq+mUj//4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YI2jAtzT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YI2jAtzT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321B91F000FF;
	Mon, 21 Sep 2026 09:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982366;
	bh=R3VWhm5DK1BFR53HtMU+M8vTk1Nt5oNf8CDsE/3Y3vo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YI2jAtzThTRUXkLRo3VokSMs5LXJ3b+47X/wzjp2A9MQPJXtTVCJgeZMMH20BHsaB
	 euMHtjmsZbFr3gDTAo01ri5nLzp+TeSj/709aes7F8xnEyIftuq9ly0dTraeFNKm7J
	 0hlftxFkdl13WZQBqOdVwrPt0qOhy0ZUtWiu9DhhAFL+OxA9Qy7DqAdUPrjFGYMiDC
	 AR4OrQxYuq8Pyr2Dyv1AhLZ5nNp96h0XFxyxdmX0mtMCABbBR7MfmWvkLeNzO8TiWc
	 ship2/zQCSp5Lriz6Kmzn2p8d1YcvXMKV9qCHv3HvFRiqSHdDkkPXkMq1TJO/CXGmA
	 6EkmbF5tXmFLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/14] crash: Extract crash_get_memory_ranges()
 helper
Reply-To: sashiko-reviews@lists.linux.dev
To: catalin.marinas@arm.com, hpa@zytor.com, bgwin@google.com, mpe@ellerman.id.au, vishal.l.verma@intel.com, takahiro.akashi@linaro.org, chleroy@kernel.org, baoquan.he@linux.dev, yeoreum.yun@arm.com, maddy@linux.ibm.com, sshegde@linux.ibm.com, ruirui.yang@linux.dev, rafael@kernel.org, coxu@redhat.com, loongarch@lists.linux.dev, leitao@debian.org, palmer@rivosinc.com, robh@kernel.org, rppt@kernel.org, jbouron@amazon.com, kees@kernel.org, james.morse@arm.com, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, mark.rutland@arm.com, npiggin@gmail.com, will@kernel.org, sourabhjain@linux.ibm.com, ritesh.list@gmail.com, pasha.tatashin@soleen.com, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, bp@alien8.de, thuth@redhat.com, chenhuacai@kernel.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, piliu@redhat.com, driver-core@lists.linux.dev, graf@amazon.com, me@linux.beauty, dave.hansen@linux.intel.com, gregkh@linuxfoundation.org, mclapinski@google.com, seanjc@google.com, maqianga@uniontech.com, chao.gao@intel.com, guodongtai@kylinos.cn, tangyouling@kylinos.cn, liukexin@kylinos.cn, dakr@kernel.org, x86@kernel.org, hbathini@linux.ibm.com, zhangtianyang@loongson.cn, tglx@kernel.org, kernel@xen0n.name, pratyush@kernel.org, eric.devolder@oracle.com, kai.huang@intel.com
Cc: kexec@lists.infradead.org, ruanjinjie@huawei.com
In-Reply-To: <20260921090450.807575-11-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-11-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:19:23 +0000
Message-Id: <20260921091924.321B91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> Factor out the crash memory range collection logic from
> crash_prepare_headers() into a separate function. This allows
> the memory hotplug path to obtain and modify the range list
> (e.g. remove offlined memory) before generating the elfcorehdr.
>=20
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan He <baoquan.he@linux.dev>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Dave Young <ruirui.yang@linux.dev>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090450.8075=
75-1-ruanjinjie@huawei.com?part=3D10

