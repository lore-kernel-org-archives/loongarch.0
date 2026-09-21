Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AE633E347;
	Mon, 21 Sep 2026 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982316; cv=none; b=Kx64QdwfpHFACtD1SYNtYoUI7wRs6eNn3qgirjJP/pkG8EqgCqT1oOn6rA/+YS33BSJ2fj8M0axN/aIoURaMGfctAMEY+dMPqs5iAgK6D6SBwwfXNaOt9yRF4r9VKZh3UV8uvBRs/OC3Zklabd+EMDzFPPvjx4LI+asM1y39GPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982316; c=relaxed/simple;
	bh=1iyqdydrL5go1Oy89+i6an9ZM1U1pl+ipauJul5B0wk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ef0P9r+uKyaJhoviOlaJYMGyJm6PmQB1tce0wM8AErVWiSQaabpt3i3+ggCixzRGZOspjXMwY6OvnC797Pqwj6SYqD78KTkwctOkZZLbnwzo5OQNwUiae8ihuj+/d3WDmfA5m1HvAkADyk3wAnQcTCfUf5SLHCohTNBVdX/kPkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMHnycOP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMHnycOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871BC1F000FF;
	Mon, 21 Sep 2026 09:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982315;
	bh=tsIzCklxA1OR0ZhVy9j+cyd5RWzkJaDGyF6RmABKvFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SMHnycOPKN9qTyZjIdzxqiQkBqe8TEOAyTaK79u+kYwBW/Wh9tJJF65/tlUGFl4Zf
	 /CqPGAac9B4NZ2mlNpo2Fzu6pZDo2D9yK2HdgqtYrF+HkXbYXVMGPmbxP9R+RhwJwV
	 YZblf79v1O7TYxdtcDmF9HQtIR5mdoqv1EBbRHqzkrJ+LRMsP/aSjLZPWJcdPQyyqH
	 gnzTMi9Nzgn9EW3vJs1OebGdTg8vKLmD+pLEukdRRqYj8nLU1eaknVh6FuPZNOWNPU
	 aAMOJXknMuq+uxAGd3fkvo0bi8Zm+cXxSIHwqVlhF5LsIdoWEUJtStC+zBb4hAAl8t
	 Ai37eNFY5eUnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/14] driver core: Add
 device_hotplug_lock_assert_held() helper
Reply-To: sashiko-reviews@lists.linux.dev
To: bp@alien8.de, kernel@xen0n.name, graf@amazon.com, npiggin@gmail.com, hpa@zytor.com, rafael@kernel.org, hbathini@linux.ibm.com, leitao@debian.org, takahiro.akashi@linaro.org, palmer@rivosinc.com, akpm@linux-foundation.org, me@linux.beauty, sshegde@linux.ibm.com, sourabhjain@linux.ibm.com, kai.huang@intel.com, x86@kernel.org, ritesh.list@gmail.com, pasha.tatashin@soleen.com, coxu@redhat.com, linuxppc-dev@lists.ozlabs.org, baoquan.he@linux.dev, mark.rutland@arm.com, linux-kernel@vger.kernel.org, piliu@redhat.com, zhangtianyang@loongson.cn, will@kernel.org, chleroy@kernel.org, chao.gao@intel.com, loongarch@lists.linux.dev, yeoreum.yun@arm.com, tangyouling@kylinos.cn, pratyush@kernel.org, rppt@kernel.org, mingo@redhat.com, seanjc@google.com, bgwin@google.com, catalin.marinas@arm.com, liukexin@kylinos.cn, driver-core@lists.linux.dev, guodongtai@kylinos.cn, mclapinski@google.com, james.morse@arm.com, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, robh@kernel.org, vishal.l.verma@intel.com, kees@kernel.org, linux-arm-kernel@lists.infradead.org, dave.hansen@linux.intel.com, jbouron@amazon.com, thuth@redhat.com, chenhuacai@kernel.org, tglx@kernel.org, maddy@linux.ibm.com, dakr@kernel.org, ruirui.yang@linux.dev, eric.devolder@oracle.com, maqianga@uniontech.com, gregkh@linuxfoundation.org, mpe@ellerman.id.au
Cc: kexec@lists.infradead.org, ruanjinjie@huawei.com
In-Reply-To: <20260921090450.807575-14-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-14-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:18:31 +0000
Message-Id: <20260921091831.871BC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> crash_get_memory_ranges() walks memblock, which memory hotplug
> modifies under device_hotplug_lock.  A caller that does not hold
> the lock can race with memblock_double_array() and iterate a freed
> regions array.
>=20
> Add device_hotplug_lock_assert_held() so that crash code can
> use it to catch such unsafe callers via lockdep.
>=20
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090450.8075=
75-1-ruanjinjie@huawei.com?part=3D13

