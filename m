Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E95390C88
	for <loongarch@lists.linux.dev>; Wed, 22 Jul 2026 02:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784688862; cv=none; b=lpHN0gSKAx0iPOFObICRwgkVRHS7M2qJsGBXGZBCQ7tsCCu+THsi/6GwP/nmA3JPE26/jFpCDZGeFU6wcsqlTqeS32XdujE0gukT0WCtwNMAz/J8wa4yaIZ0ghgL5eh+5n0COdCWCbVfMfGV3gtFm2AhPblvqSN0SzqhQro/bKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784688862; c=relaxed/simple;
	bh=X/PHmxHQsji0aiwDgyHTkB5LP3n+JR02L60nBwssPH4=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=uWBc8xvZ3F6tgdKKZWLE0gwjD41uJ43BftfzK6hBUfVI1EZdslmWOu0Gs4tAmUWz/LZk5VPPkpvcua3wxFsS3KkRp3iMIzqpHVuTbHzeqNL7BpM6KaPt6FbOeXQlrR93iA4GTLs/KfYWhAFzkjbU8SEsO1ULD1wFOkGsquz9UMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RO6Z/bJi; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RO6Z/bJi"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784688856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0VEp3ESpAKKv6qCDSWIvcLI1saAISd7A8qAS6HnaPq8=;
	b=RO6Z/bJiXgsdhFMoPczYp4xa5PRX/8u54StKCQ8Xub8AYBdf9wirPzVQZigtYqOUwLgDzA
	Xk3LCMO41/B1f1Un1ip4tKrF6rkT4Ug/xRy/Zn2A+7c3UfkjHjUvE7rGNIz4pdbqsgSGAh
	ck/FM7eetstdmlfPUa1co2fxTRrc8bs=
Date: Wed, 22 Jul 2026 02:54:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: haoran.jiang@linux.dev
Message-ID: <83b544072099ee1b03359d1a4c1c2af89f8fde65@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 0/2] Add support to dump the kernel page tables
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel@xen0n.name, yangtiezhu@loongson.cn, "Haoran Jiang"
 <jianghaoran@kylinos.cn>
In-Reply-To: <CAAhV-H7GwHp1q-c5igf82h5gk1G5uDx+-gcrtqZsYHn_vbnR1g@mail.gmail.com>
References: <20260707064556.371881-1-haoran.jiang@linux.dev>
 <CAAhV-H7GwHp1q-c5igf82h5gk1G5uDx+-gcrtqZsYHn_vbnR1g@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

2026=E5=B9=B47=E6=9C=8810=E6=97=A5 20:52, "Huacai Chen" <chenhuacai@kerne=
l.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cchenhuac=
ai%40kernel.org%3E > =E5=86=99=E5=88=B0:


>=20
>=20Hi, Haoran,
>=20
>=20On Tue, Jul 7, 2026 at 2:47 PM <haoran.jiang@linux.dev> wrote:
>=20
>=20>=20
>=20> From: Haoran Jiang <jianghaoran@kylinos.cn>
> >=20
>=20>  Enforce the W^X principle on page tables,
> >  and also support the kernel page dump feature.
> >=20
>=20>  The following tests were performed:
> >=20
>=20>  kdb:
> >  echo kgdbts=3DV1 > /sys/module/kgdbts/parameters/kgdbts
> >=20
>=20>  ebpf:
> >  ./test_progs -t struct_ops -d struct_ops_multi_pages
> >  ./test_progs -t fexit_stress
> >  ./test_progs -t module_fentry_shadow
> >  ./test_progs -t fentry_test/fentry
> >  ./test_progs -t fexit_test/fexit
> >  ./test_progs -t modify_return
> >  ./test_progs -t fexit_sleep
> >  ./test_progs -t test_overhead
> >  ./test_progs -t trampoline_count
> >  ./test_progs -t kprobe
> >  ./test_progs -t uprobe
> >=20
>=20>  livepatch:
> >  insmod samples/livepatch/livepatch_sample.ko
> >=20
>=20>  kprobe:
> >  insmod samples/kprobes/kprobe_example.ko
> >  insmod samples/kprobes/kretprobe_example.ko
> >=20
>=20>  unxibench:
> >  before this patch:
> >  running 1 parallel copy of tests: 1492
> >  running 128 parallel copies of tests: 8765
> >=20
>=20>  after this patch:
> >  running 1 parallel copy of tests: 1440
> >  running 128 parallel copies of tests: 8749
> >=20
>=20I hope you have verified ftrace, kprobes, jump label, kgdb, etc. on
> modules, not only on the kernel itself. Otherwise the tests are not
> enough.
>=20
jump=20label:
Tested with the kernel test module at `/lib/test_static_keys.c`. The `sta=
tic_branch_likely()` and `static_branch_unlikely()` functions
 were exercised in module context, and all test cases passed successfully=
.

cd lib
insmod test_static_key_base.ko
insmod test_static_keys.ko

kprobe:
With ftrace disabled, used the kprobe sample module from `samples/kprobe/=
` in the kernel source to trace functions in a custom module.=20
The=20tracing of functions within the module worked as expected.

cd sample/kprobe
insmod kprobe_example.ko symbol=3D"test_print"
insmod kretprobe_example.ko func=3D"test_print"


[  798.077262] handler_pre: <test_print> p->addr =3D 0x000000007e1cc0d2, =
era =3D 0xffff800003474000, estat =3D 0xc0000
[  798.087827] handler_post: <test_print> p->addr =3D 0x000000007e1cc0d2,=
 estat =3D 0xc0000
[  798.116541] test_print returned 39 and took 39280450 ns to execute


ftrace:
With ftrace and fprobe enabled, the following eBPF program was used to tr=
ace functions such as `bpf_testmod_fentry_test1()`=20
in=20the `bpf_testmod.c` module. The underlying mechanism leverages ftrac=
e capabilities, and all tests passed successfully.

cd tools/testing/selftests/bpf

./test_progs -t kprobe_multi_testmod_test
#172/1   kprobe_multi_testmod_test/testmod_attach_api_syms:OK
#172/2   kprobe_multi_testmod_test/testmod_attach_api_addrs:OK
#172     kprobe_multi_testmod_test:OK
Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED


kdb:
With KDB enabled, I installed breakpoints on functions in the module and =
performed single-step execution tests via KDB.=20
The=20tests passed successfully. During the testing, we observed that sin=
gle-step debugging triggered an Oops error,=20
but=20this issue is unrelated to the two patches mentioned above.

[112]kdb> ss

Entering kdb (current=3D0x900020009f520000, pid 10661) on processor 112 O=
ops: (null)
due to oops @ 0x90000000005b57a4

I have submitted a fix patch for this issue.

https://lore.kernel.org/loongarch/20260722024409.158142-1-haoran.jiang@li=
nux.dev/T/#u



> @Tiezhu, you are familiar with all the above mechanisms, so please
> help to review, and double check whether uprobes need to be modified.
>=20
>=20Huacai
>=20
>=20>=20
>=20> Haoran Jiang (2):
> >  LoongArch: Enforce W^X for page-mapped virtual memory region
> >  LoongArch: Add support to dump the kernel page tables
> >=20
>=20>  arch/loongarch/Kconfig | 2 +
> >  arch/loongarch/include/asm/pgtable-bits.h | 12 +-
> >  arch/loongarch/kernel/ftrace_dyn.c | 16 +
> >  arch/loongarch/kernel/inst.c | 25 +-
> >  arch/loongarch/kernel/jump_label.c | 3 +
> >  arch/loongarch/kernel/kgdb.c | 50 +++
> >  arch/loongarch/kernel/kprobes.c | 4 +-
> >  arch/loongarch/mm/Makefile | 1 +
> >  arch/loongarch/mm/ptdump.c | 474 ++++++++++++++++++++++
> >  9 files changed, 575 insertions(+), 12 deletions(-)
> >  create mode 100644 arch/loongarch/mm/ptdump.c
> >=20
>=20>  --
> >  2.43.0
> >
>
