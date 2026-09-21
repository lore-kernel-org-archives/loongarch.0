Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46724356770;
	Mon, 21 Sep 2026 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982395; cv=none; b=I6CAo7fvPyoTzkIrF/3hYiaS9WmBSmRKZO3ARqTxhfbB/4Rr3MflWBsNaf5rCLhL1j+owE3QFQYw4IIPYjnaX7Cr47vqImS/pwUpG1ZGoor5HEU+W32FgA92uLdnWgAxGhF2GlxMP8hvGLnlXHiZ9IA4as5Q9UY+RBWUaNAIi0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982395; c=relaxed/simple;
	bh=AENc5PoN4tg4eog3EuDY2lgukB8xBmNUVdIdsr8Byh4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jasqd055AJnHojN8efHyJqC+Kyq6oyuwNwPLh4+55TnY0O7VxRjXvVYB2eXgFF3PcaAiRQ7wG8cxTFaHFUKN/FCaJP6eEWNI5gqjzWV3NkN0Iyz+01YXO9lP3Db3mlVeMIbujyZD12QTU35nXeRNCqBg2kSapCH80ZjXF/8OB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgcUGeAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgcUGeAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE231F000FF;
	Mon, 21 Sep 2026 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982393;
	bh=lYPW2EitrWksOeNywbT4ACddfE8LBXRuHuJ++AYnkVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HgcUGeADs7/M03n4e2fM1RNJ+WDOaeSKU+QjIz/LtyFBUbeVb4L6/srXNM6s+yLNv
	 lemuTopLmR2RY1n46up1y6lfw2TMG+aXggHsOLTYpKvTSW+vgKxMx6SkvQeFQps3ws
	 LZmwqCnE+K8/UsHYTHgJgNTPjKAMTLM+s8evUKg2waXxzx3eq6dsntJvuKU8eTySRy
	 n36264uQDAJ9ioRxlPfRKtNGms4PwRu3OHjhXWjPEXx3gi/RjiBAl7Ew39lMayDC/6
	 xPzGfGJQuRTpNBCK4aGXsXkjg0/RZfLekSNvS3HBjltpptS1F1D56r968uAhWjn0Vv
	 hAK7VnVuwYw0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/14] crash: Normalize the kexec_load elfcorehdr at
 load time
Reply-To: sashiko-reviews@lists.linux.dev
To: zhangtianyang@loongson.cn, chleroy@kernel.org, eric.devolder@oracle.com, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, dakr@kernel.org, guodongtai@kylinos.cn, hpa@zytor.com, kernel@xen0n.name, chao.gao@intel.com, pasha.tatashin@soleen.com, npiggin@gmail.com, coxu@redhat.com, liukexin@kylinos.cn, seanjc@google.com, bgwin@google.com, rppt@kernel.org, bp@alien8.de, kai.huang@intel.com, sshegde@linux.ibm.com, kees@kernel.org, mpe@ellerman.id.au, tglx@kernel.org, jbouron@amazon.com, yeoreum.yun@arm.com, "Jinjie
 Ruan" <ruanjinjie@huawei.com>, maddy@linux.ibm.com, gregkh@linuxfoundation.org, will@kernel.org, pratyush@kernel.org, akpm@linux-foundation.org, robh@kernel.org, tangyouling@kylinos.cn, piliu@redhat.com, hbathini@linux.ibm.com, mark.rutland@arm.com, chenhuacai@kernel.org, me@linux.beauty, mclapinski@google.com, dave.hansen@linux.intel.com, ritesh.list@gmail.com, x86@kernel.org, linux-arm-kernel@lists.infradead.org, leitao@debian.org, palmer@rivosinc.com, maqianga@uniontech.com, james.morse@arm.com, takahiro.akashi@linaro.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, vishal.l.verma@intel.com, catalin.marinas@arm.com, graf@amazon.com, sourabhjain@linux.ibm.com, mingo@redhat.com, ruirui.yang@linux.dev, rafael@kernel.org, baoquan.he@linux.dev, thuth@redhat.com
Cc: kexec@lists.infradead.org, ruanjinjie@huawei.com
In-Reply-To: <20260921090450.807575-13-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-13-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:19:51 +0000
Message-Id: <20260921091951.BDE231F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

> For kexec_load() the kernel does not build the elfcorehdr, so it is only
> rewritten by the first crash hotplug event.  CPU hotplug events do not
> change the elfcorehdr, but they may run without device_hotplug_lock
> (e.g. CPU offlining during suspend), so they cannot perform that rewrite
> without racing with memory hotplug.
>=20
> Normalize the elfcorehdr once when the crash image is installed via
> crash_hotplug_prepare_elfcorehdr(), while device_hotplug_lock can still
> be taken safely, and let the hotplug paths skip CPU events entirely.
> Architectures that do not need the rewrite  (e.g. powerpc) treat
> KEXEC_CRASH_HP_NONE as a no-op.
>=20
> The x86 crash hotplug handler now skips CPU hotplug events
> unconditionally, so nothing reads image->elfcorehdr_updated anymore.
> Drop the field and the code that maintains it.
> [ ... ]
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Dave Young <ruirui.yang@linux.dev>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090450.8075=
75-1-ruanjinjie@huawei.com?part=3D12

