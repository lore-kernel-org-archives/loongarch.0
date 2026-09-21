Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C469529B228;
	Mon, 21 Sep 2026 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982263; cv=none; b=O2I0JyrEw/j5Wq+bCbwTppVhxL5ykLXG/3FJQJ/UBhwTrxjyrMwQpThvBgarvEf7D5B/PxddoTNzAik0v20o6DVunEUtQHrFseTWLIzXBfP+5Plz5W0ChaC8BWmIBHCzN3thmcda9ePOxudRytVMzd2T9AhHdvTkUcRrkl1vutc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982263; c=relaxed/simple;
	bh=zf/aQsXCzB2e/77wVQGKOahnDXi6wvJ7QdslTWDQRvM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rHAaN7zDcOm/lCvKpKPwA56kC+lQYurRxebXzHY9fskByLUMDra7FlWVewyQ8FIhDb1YTpk1doIFwuwq7DQxFbkfAEfJf1BYcS4WxuXErQnbB5fDmFHPNNMGURQqhscOcmayPF6g4i8GrTtXyZfA4FYoIqvfeV4IQAAbLS+Rh1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFlwMSx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFlwMSx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910851F000FF;
	Mon, 21 Sep 2026 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982262;
	bh=zf/aQsXCzB2e/77wVQGKOahnDXi6wvJ7QdslTWDQRvM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fFlwMSx4XeKM/6ODRT6JIAmtyQ4iEB13D+VkG7AENmXdbJad/d+MVzmnISIIvek0M
	 f+CHwALM7JHKTxEDD43GtZjOUgeokyAc9m/HG5veIoAOJnardr+uvolW59fEQBZ7OU
	 I+vkPy+6giY6egbg8LMvh/SdU7D+6/ePY6zyRKrlMCbvKsfKsmvv2GxY3etcV07GF6
	 /VjWuDWk6CJbQVZ8ECqpM7BX3LYQ+rc3uhPtMWw5iTdlZLsTFvMC8UBtOzw7FW3trh
	 Pm8gM7D9e5FWg2yIhbkwsqxRdTXs4ftgrC4VptFd7h8AmD6MVY6etE1HFkZZJnfZKd
	 R60b4F6ylFMOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/14] crash: Factor out crash_find_elfcorehdr()
 helper
Reply-To: sashiko-reviews@lists.linux.dev
To: dave.hansen@linux.intel.com, chao.gao@intel.com, driver-core@lists.linux.dev, tglx@kernel.org, leitao@debian.org, chenhuacai@kernel.org, piliu@redhat.com, seanjc@google.com, chleroy@kernel.org, gregkh@linuxfoundation.org, kees@kernel.org, zhangtianyang@loongson.cn, mclapinski@google.com, will@kernel.org, kai.huang@intel.com, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, eric.devolder@oracle.com, akpm@linux-foundation.org, pratyush@kernel.org, loongarch@lists.linux.dev, x86@kernel.org, mpe@ellerman.id.au, robh@kernel.org, rafael@kernel.org, pasha.tatashin@soleen.com, ruirui.yang@linux.dev, jbouron@amazon.com, tangyouling@kylinos.cn, vishal.l.verma@intel.com, npiggin@gmail.com, yeoreum.yun@arm.com, mark.rutland@arm.com, takahiro.akashi@linaro.org, mingo@redhat.com, liukexin@kylinos.cn, kernel@xen0n.name, maqianga@uniontech.com, sourabhjain@linux.ibm.com, linux-kernel@vger.kernel.org, sshegde@linux.ibm.com, james.morse@arm.com, linuxppc-dev@lists.ozlabs.org, hpa@zytor.com, hbathini@linux.ibm.com, linux-arm-kernel@lists.infradead.org, thuth@redhat.com, graf@amazon.com, dakr@kernel.org, bgwin@google.com, me@linux.beauty, guodongtai@kylinos.cn, palmer@rivosinc.com, bp@alien8.de, catalin.marinas@arm.com, coxu@redhat.com, rppt@kernel.org, maddy@linux.ibm.com, baoquan.he@linux.dev, ritesh.list@gmail.com
Cc: ruanjinjie@huawei.com, kexec@lists.infradead.org
In-Reply-To: <20260921090450.807575-12-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-12-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:17:39 +0000
Message-Id: <20260921091739.910851F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> The elfcorehdr segment is located by scanning the segments for
> the ELF magic. Factor that scan out into a new helper function,
> crash_find_elfcorehdr(), to clean up crash_handle_hotplug_event()
> and prepare for its reuse in crash hotplug code.
>=20
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan He <baoquan.he@linux.dev>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Dave Young <ruirui.yang@linux.dev>
> Cc: Breno Leitao <leitao@debian.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090450.8075=
75-1-ruanjinjie@huawei.com?part=3D11

