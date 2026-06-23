Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F96A21CC5A
	for <loongarch@lists.linux.dev>; Tue, 23 Jun 2026 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207195; cv=none; b=DQuWjvMWY4RJvWt+WQOhgE8G4c63NVctcmFjsUiwge9WN5yxRqdsunYG9D+0snChORQoouW+YhKFDanPASkQhnnkjcEQthHWpz51H6rivoaXL4lnFB9MJ3uGrOazf04/ENdjztHs43WFN4h2anUBzYY0Gpx7fb/7bC3f+kVS7KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207195; c=relaxed/simple;
	bh=uI3hQ4cOA77ymRK3h6IkgLpLUJqxaYfmsr6N1OCDz8g=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=BK5wqrFXrHvTqwlFB7trV2aBHa8E+UlHsj2E/JqO9A+mTbYm+V6HeN3OHQfwY1p+BTO3Fb2iicYBqYpSXRUZyXt73eaWl18ruYilfNp8haBqqczHD7HEOAlGY/prpeu3Z8Dv/yi30MI1Z9aAN7hbM28bxRZ+lXj3NizX8Gz9LWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GULSXWO0; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GULSXWO0"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782207191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=44edOhrSOQMBoRlQJvnwh58N0KjRqewJFHP9jgYGIcs=;
	b=GULSXWO04qZ5Kwjd2bw97dviMFAiqXS9qfHwsyIyTBNhQ6NPtuht4UtJ2TVRrBL4Ni75Eb
	aQBtFbnh/PAhIAi7ytcuyPgjAj/AHOIsZKJFCiqt5HClO0pW78S7dm1p6qjzsxLx71fA3/
	Xf1/LOhv7/y71FRE0FMQpEW/DdHGnXA=
Date: Tue, 23 Jun 2026 09:33:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: haoran.jiang@linux.dev
Message-ID: <ed75177141bbd5165b8cb2f257058b0c28987510@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v4] LoongArch: Enable STRICT_MODULE_RWX for stricter
 modules memory permissions
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel@xen0n.name, akpm@linux-foundation.org, jbohac@suse.cz,
 kees@kernel.org, yangtiezhu@loongson.cn, "Haoran Jiang"
 <jianghaoran@kylinos.cn>, zhangqing@loongson.cn, zhoubinbin@loongson.cn
In-Reply-To: <CAAhV-H7MYQ2e=x6iXq6iF1YoMNEGsPanRDxNbHfqpd=8XUFUpw@mail.gmail.com>
References: <20260613084147.449502-1-haoran.jiang@linux.dev>
 <CAAhV-H5tzMMopjvgLU0wzB8B6hO9QrbkxavD=0e6Sn4Oi4q3vQ@mail.gmail.com>
 <771c9cbf977e0f724055b2880739afdfb3e7d8a4@linux.dev>
 <CAAhV-H6LY=MrFgji=4NMwDVifM7+dEf+icHhSAh1wOXvqn9L3g@mail.gmail.com>
 <2a177d2542d7d1f749691cc9c661a16652d1e4f1@linux.dev>
 <CAAhV-H7MYQ2e=x6iXq6iF1YoMNEGsPanRDxNbHfqpd=8XUFUpw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

2026=E5=B9=B46=E6=9C=8822=E6=97=A5 10:29, "Huacai Chen" <chenhuacai@kerne=
l.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cchenhuac=
ai%40kernel.org%3E > =E5=86=99=E5=88=B0:


>=20
>=20On Sun, Jun 21, 2026 at 8:12 AM <haoran.jiang@linux.dev> wrote:
>=20
>=20>=20
>=20> 2026=E5=B9=B46=E6=9C=8814=E6=97=A5 20:10, "Huacai Chen" <chenhuacai=
@kernel.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cch=
enhuacai%40kernel.org%3E > =E5=86=99=E5=88=B0:
> >=20
>=20>  On Sun, Jun 14, 2026 at 6:24 PM <haoran.jiang@linux.dev> wrote:
> >=20
>=20>  >
> >  > 2026=E5=B9=B46=E6=9C=8813=E6=97=A5 18:43, "Huacai Chen" <chenhuaca=
i@kernel.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cc=
henhuacai%40kernel.org%3E > =E5=86=99=E5=88=B0:
> >  >
> >  > Hi, Haoran,
> >  >
> >  > On Sat, Jun 13, 2026 at 4:42 PM <haoran.jiang@linux.dev> wrote:
> >  >
> >  > >
> >  > > From: Haoran Jiang <jianghaoran@kylinos.cn>
> >  > >
> >  > > Enable STRICT_MODULE_RWX to enforce strict memory permissions
> >  > > on modules,making the code region non-writable, the data region
> >  > > non-executable, and the read-only data region both non-writable
> >  > > and non-executable.Temporarily modify code section read/write
> >  > > permissions via set_memory() API.
> >  > >
> >  > > Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> >  > > ---
> >  > > v2:
> >  > > Change the method of modifying page table permissions from patch=
_map to set_memory() API.
> >  > >
> >  > > v3:
> >  > > Modify commit description.
> >  > >
> >  > > v4:
> >  > > Add text_mutex lock in the larch_insn_write call path and
> >  > > CONFIG_STRICT_MODULE_RWX is enabled by default.
> >  > >
> >  > > UB test on the 3C6000 server shows no significant performance im=
pact.
> >  > >
> >  > > Before patch:
> >  > >
> >  > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >  > > BYTE UNIX Benchmarks (Version 5.1.6)
> >  > >
> >  > > System: localhost.localdomain: GNU/Linux
> >  > > OS: GNU/Linux -- 7.1.0-rc6 -- #1 SMP PREEMPT Wed Jun 10 21:07:41=
 CST 2026
> >  > > Machine: loongarch64 (loongarch64)
> >  > > Language: en_US.utf8 (charmap=3D"UTF-8", collate=3D"UTF-8")
> >  > > 21:19:51 up 1 min, 2 users, load average: 0.71, 0.38, 0.14; runl=
evel 2026-06-10
> >  > >
> >  > > ----------------------------------------------------------------=
--------
> >  > > 128 CPUs in system; running 1 parallel copy of tests
> >  > >
> >  > > Dhrystone 2 using register variables 35205725.4 lps (10.0 s, 7 s=
amples)
> >  > > Double-Precision Whetstone 4244.9 MWIPS (10.0 s, 7 samples)
> >  > > Execl Throughput 6717.7 lps (30.0 s, 2 samples)
> >  > > File Copy 1024 bufsize 2000 maxblocks 1213873.8 KBps (30.0 s, 2 =
samples)
> >  > > File Copy 256 bufsize 500 maxblocks 350740.5 KBps (30.0 s, 2 sam=
ples)
> >  > > File Copy 4096 bufsize 8000 maxblocks 3275103.0 KBps (30.0 s, 2 =
samples)
> >  > > Pipe Throughput 1981993.9 lps (10.0 s, 7 samples)
> >  > > Pipe-based Context Switching 55287.7 lps (10.0 s, 7 samples)
> >  > > Process Creation 9056.8 lps (30.0 s, 2 samples)
> >  > > Shell Scripts (1 concurrent) 6736.5 lpm (60.0 s, 2 samples)
> >  > > Shell Scripts (8 concurrent) 2109.8 lpm (60.0 s, 2 samples)
> >  > > System Call Overhead 1549110.9 lps (10.0 s, 7 samples)
> >  > >
> >  > > System Benchmarks Index Values BASELINE RESULT INDEX
> >  > > Dhrystone 2 using register variables 116700.0 35205725.4 3016.8
> >  > > Double-Precision Whetstone 55.0 4244.9 771.8
> >  > > Execl Throughput 43.0 6717.7 1562.3
> >  > > File Copy 1024 bufsize 2000 maxblocks 3960.0 1213873.8 3065.3
> >  > > File Copy 256 bufsize 500 maxblocks 1655.0 350740.5 2119.3
> >  > > File Copy 4096 bufsize 8000 maxblocks 5800.0 3275103.0 5646.7
> >  > > Pipe Throughput 12440.0 1981993.9 1593.2
> >  > > Pipe-based Context Switching 4000.0 55287.7 138.2
> >  > > Process Creation 126.0 9056.8 718.8
> >  > > Shell Scripts (1 concurrent) 42.4 6736.5 1588.8
> >  > > Shell Scripts (8 concurrent) 6.0 2109.8 3516.4
> >  > > System Call Overhead 15000.0 1549110.9 1032.7
> >  > > =3D=3D=3D=3D=3D=3D=3D=3D
> >  > > System Benchmarks Index Score 1492.2
> >  > >
> >  > > ----------------------------------------------------------------=
--------
> >  > > 128 CPUs in system; running 128 parallel copies of tests
> >  > >
> >  > > Dhrystone 2 using register variables 2901925470.7 lps (10.0 s, 7=
 samples)
> >  > > Double-Precision Whetstone 503614.9 MWIPS (10.1 s, 7 samples)
> >  > > Execl Throughput 34080.1 lps (29.9 s, 2 samples)
> >  > > File Copy 1024 bufsize 2000 maxblocks 309291.4 KBps (30.0 s, 2 s=
amples)
> >  > > File Copy 256 bufsize 500 maxblocks 75115.3 KBps (30.0 s, 2 samp=
les)
> >  > > File Copy 4096 bufsize 8000 maxblocks 1018101.3 KBps (30.0 s, 2 =
samples)
> >  > > Pipe Throughput 180702003.1 lps (10.0 s, 7 samples)
> >  > > Pipe-based Context Switching 2426596.4 lps (10.0 s, 7 samples)
> >  > > Process Creation 37282.5 lps (30.0 s, 2 samples)
> >  > > Shell Scripts (1 concurrent) 50813.7 lpm (60.1 s, 2 samples)
> >  > > Shell Scripts (8 concurrent) 5835.8 lpm (60.4 s, 2 samples)
> >  > > System Call Overhead 9039181.1 lps (10.0 s, 7 samples)
> >  > >
> >  > > System Benchmarks Index Values BASELINE RESULT INDEX
> >  > > Dhrystone 2 using register variables 116700.0 2901925470.7 24866=
5.4
> >  > > Double-Precision Whetstone 55.0 503614.9 91566.3
> >  > > Execl Throughput 43.0 34080.1 7925.6
> >  > > File Copy 1024 bufsize 2000 maxblocks 3960.0 309291.4 781.0
> >  > > File Copy 256 bufsize 500 maxblocks 1655.0 75115.3 453.9
> >  > > File Copy 4096 bufsize 8000 maxblocks 5800.0 1018101.3 1755.3
> >  > > Pipe Throughput 12440.0 180702003.1 145258.8
> >  > > Pipe-based Context Switching 4000.0 2426596.4 6066.5
> >  > > Process Creation 126.0 37282.5 2958.9
> >  > > Shell Scripts (1 concurrent) 42.4 50813.7 11984.4
> >  > > Shell Scripts (8 concurrent) 6.0 5835.8 9726.4
> >  > > System Call Overhead 15000.0 9039181.1 6026.1
> >  > > =3D=3D=3D=3D=3D=3D=3D=3D
> >  > > System Benchmarks Index Score 8765.2
> >  > >
> >  > > After patch:
> >  > >
> >  > > 128 CPUs in system; running 1 parallel copy of tests
> >  > >
> >  > > Dhrystone 2 using register variables 35438193.7 lps (10.0 s, 7 s=
amples)
> >  > > Double-Precision Whetstone 4245.7 MWIPS (10.0 s, 7 samples)
> >  > > Execl Throughput 5293.7 lps (30.0 s, 2 samples)
> >  > > File Copy 1024 bufsize 2000 maxblocks 1233323.4 KBps (30.0 s, 2 =
samples)
> >  > > File Copy 256 bufsize 500 maxblocks 355264.5 KBps (30.0 s, 2 sam=
ples)
> >  > > File Copy 4096 bufsize 8000 maxblocks 3333631.6 KBps (30.0 s, 2 =
samples)
> >  > > Pipe Throughput 1979613.2 lps (10.0 s, 7 samples)
> >  > > Pipe-based Context Switching 55675.2 lps (10.0 s, 7 samples)
> >  > > Process Creation 8528.1 lps (30.0 s, 2 samples)
> >  > > Shell Scripts (1 concurrent) 6870.0 lpm (60.0 s, 2 samples)
> >  > > Shell Scripts (8 concurrent) 2115.5 lpm (60.0 s, 2 samples)
> >  > > System Call Overhead 1546959.4 lps (10.0 s, 7 samples)
> >  > >
> >  > > System Benchmarks Index Values BASELINE RESULT INDEX
> >  > > Dhrystone 2 using register variables 116700.0 35438193.7 3036.7
> >  > > Double-Precision Whetstone 55.0 4245.7 772.0
> >  > > Execl Throughput 43.0 5293.7 1231.1
> >  > > File Copy 1024 bufsize 2000 maxblocks 3960.0 1233323.4 3114.5
> >  > > File Copy 256 bufsize 500 maxblocks 1655.0 355264.5 2146.6
> >  > > File Copy 4096 bufsize 8000 maxblocks 5800.0 3333631.6 5747.6
> >  > > Pipe Throughput 12440.0 1979613.2 1591.3
> >  > > Pipe-based Context Switching 4000.0 55675.2 139.2
> >  > > Process Creation 126.0 8528.1 676.8
> >  > > Shell Scripts (1 concurrent) 42.4 6870.0 1620.3
> >  > > Shell Scripts (8 concurrent) 6.0 2115.5 3525.8
> >  > > System Call Overhead 15000.0 1546959.4 1031.3
> >  > > =3D=3D=3D=3D=3D=3D=3D=3D
> >  > > System Benchmarks Index Score 1465.3
> >  > >
> >  > > ----------------------------------------------------------------=
--------
> >  > > 128 CPUs in system; running 128 parallel copies of tests
> >  > >
> >  > > Dhrystone 2 using register variables 2903340286.5 lps (10.0 s, 7=
 samples)
> >  > > Double-Precision Whetstone 504137.7 MWIPS (10.1 s, 7 samples)
> >  > > Execl Throughput 34332.8 lps (29.9 s, 2 samples)
> >  > > File Copy 1024 bufsize 2000 maxblocks 311391.2 KBps (30.0 s, 2 s=
amples)
> >  > > File Copy 256 bufsize 500 maxblocks 72503.3 KBps (30.0 s, 2 samp=
les)
> >  > > File Copy 4096 bufsize 8000 maxblocks 1000861.7 KBps (30.0 s, 2 =
samples)
> >  > > Pipe Throughput 179382076.6 lps (10.0 s, 7 samples)
> >  > > Pipe-based Context Switching 2415716.6 lps (10.0 s, 7 samples)
> >  > > Process Creation 36873.1 lps (30.0 s, 2 samples)
> >  > > Shell Scripts (1 concurrent) 51464.1 lpm (60.1 s, 2 samples)
> >  > > Shell Scripts (8 concurrent) 5976.3 lpm (60.4 s, 2 samples)
> >  > > System Call Overhead 9182389.5 lps (10.0 s, 7 samples)
> >  > >
> >  > > System Benchmarks Index Values BASELINE RESULT INDEX
> >  > > Dhrystone 2 using register variables 116700.0 2903340286.5 24878=
6.7
> >  > > Double-Precision Whetstone 55.0 504137.7 91661.4
> >  > > Execl Throughput 43.0 34332.8 7984.4
> >  > > File Copy 1024 bufsize 2000 maxblocks 3960.0 311391.2 786.3
> >  > > File Copy 256 bufsize 500 maxblocks 1655.0 72503.3 438.1
> >  > > File Copy 4096 bufsize 8000 maxblocks 5800.0 1000861.7 1725.6
> >  > > Pipe Throughput 12440.0 179382076.6 144197.8
> >  > > Pipe-based Context Switching 4000.0 2415716.6 6039.3
> >  > > Process Creation 126.0 36873.1 2926.4
> >  > > Shell Scripts (1 concurrent) 42.4 51464.1 12137.8
> >  > > Shell Scripts (8 concurrent) 6.0 5976.3 9960.6
> >  > > System Call Overhead 15000.0 9182389.5 6121.6
> >  > > =3D=3D=3D=3D=3D=3D=3D=3D
> >  > > System Benchmarks Index Score 8759.8
> >  > >
> >  > I think your tests are incomplete. Performance test is just a very
> >  > basic test, you should make sure all dynamic code modification
> >  > mechanisms are correct.
> >  >
> >  > At least these should be verified one by one: jump label, kgdb, bp=
f,
> >  > ftrace, kprobes, uprobes....
> >  >
> >  > You have modified ftrace, but not the best method that Ihae sugges=
ted in V3.
> >  >
> >  > You completely ignore my suggestion about kprobes in V3.
> >  >
> >  > For KGDB, you should use text_mutex to protect copy_to_kernel_nofa=
ult().
> >  >
> >  > For uprobes, I have no idea, maybe @Tiezhu can give some suggestio=
ns.
> >  >
> >  > Huacai
> >  >
> >  > For fentry:
> >  >
> >  > ftrace_arch_code_modify_prepare() and ftrace_arch_code_modify_post=
_process() are not in the call path of ftrace_init_nop(),
> >  >
> >  > so the text_mutex lock was added in ftrace_modify_code(). However,=
 I overlooked that ftrace_init_nop() also holds the text_mutex lock (e.g.=
, on RISC-V).
> >  > I am fixing this.
> >  >
> >  No, RISC-V is right, use ftrace_arch_code_modify_prepare() and
> >  ftrace_arch_code_modify_post_process() to protect all common cases,
> >  and use text_mutex to protect the only exception, ftrace_init_nop().
> >=20
>=20>  >
> >  > For kprobes:
> >  >
> >  > text_mutex is already held in the caller arm_kprobe(), which then =
calls arch_arm_kprobe->larch_insn_text_copy. So the kprobes path is prope=
rly protected.
> >  >
> >  No, I doubt you didn't see my link, we are talking about
> >  arch_prepare_ss_slot(). Though it seems the framework has hold
> >  text_mutex, but you don't use the larch_insn_patch_text() API, who
> >  handle the RWX?
> >=20
>=20>  >
> >  > For kgdb:
> >  >
> >  > When KGDB enters do_single_step(), it has already stopped executio=
n on all other CPUs. Only the current CPU is running KGDB logic. Do we ne=
ed to worry about concurrency issues in this case? Also, Sleepable lock i=
s also disallowed in exception context.
> >  >
> >  The same as above, if you use copy_to_kernel_nofault() directly, who
> >  handle the RWX?
> >=20
>=20>  Huacai
> >=20
>=20>  I plan to make the following modifications. Is this approach feasi=
ble?
> >=20
>=20>  1=EF=BC=8C For kprobes:
> >=20
>=20>  Add modifications for `arch_prepare_ss_slot(struct kprobe *p)`, re=
ferencing the patch at:
> >  https://lore.kernel.org/loongarch/CAHirt9gSXZvw0wTv9zupsVRG0_ekza08e=
fW0hwq_yvnU1WbUng@mail.gmail.com/T/#m6a75415f468e671748d6ec8c6b502ca36788=
c546
> >=20
>=20>  static void arch_prepare_ss_slot(struct kprobe *p)
> >  {
> >  larch_insn_patch_text(p->ainsn.insn, *p->addr);
> >  larch_insn_patch_text(p->ainsn.insn + 1, KPROBE_SSTEPBP_INSN);
> >  p->ainsn.restore =3D (unsigned long)p->addr + LOONGARCH_INSN_SIZE;
> >  }
> >=20
>=20>  2,For kgdb:
> >=20
>=20>  Modify page table permissions for the kernel code section by addin=
g the following lockless method. Use `apply_to_existing_page_range()` to =
iterate over
> >  the virtual address range and perform permission modification operat=
ions on existing page table entries (PTEs).
> >=20
>=20>  This approach references the RISC-V commit:
> >  fb1cf0878328 ("riscv: rewrite __kernel_map_pages() to fix sleeping i=
n invalid context")
> >=20
>=20>  static int change_page_attr(pte_t *ptep, unsigned long addr, void =
*data)
> >  {
> >  handle the RWX
> >  }
> >  static int kgdb_set_page_rw(unsigned long addr, int numpages, long a=
ction)
> >  {
> >  ...
> >  apply_to_existing_page_range(&init_mm, start, size,
> >  change_page_attr, (void *)action);
> >=20
>=20>  flush_tlb_kernel_range(addr, addr + size);
> >  ...
> >=20
>=20>  }
> >=20
>=20>  int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
> >  {
> >  ...
> >  kgdb_set_page_rw(bpt->bpt_addr,1,0);
> >  err =3D copy_to_kernel_nofault((char *)bpt->bpt_addr,
> >  arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE);
> >  kgdb_set_page_rw_(bpt->bpt_addr,1,1);
> >  ...
> >  }
> >=20
>=20>  static int do_single_step(struct pt_regs *regs)
> >  {
> >  ...
> >  kgdb_set_page_rw(bpt->bpt_addr,1,0)=EF=BC=9B
> >  error =3D copy_to_kernel_nofault((void *)stepped_address,
> >  arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE);
> >  kgdb_set_page_rw_(bpt->bpt_addr,1,1);
> >  ...
> >  }
> >=20
>=20So complicated? Why not replace copy_to_kernel_nofault() with
> larch_insn_write() directly?
>=20

larch_insn_write->set_memory_rw->__set_memory->mmap_write_lock(&init_mm)

The=20call path holds a lock that may sleep. Invoking `larch_insn_write()=
` within the KGDB exception context is risky,=20
as=20the context does not permit sleeping.

> >=20
>=20> 3=EF=BC=8Cuprobes write to userspace process code segments, which d=
oes not conflict with kernel code segment modifications. Therefore, chang=
es for `STRICT_MODULE_RWX` do not affect uprobes.
> >=20
>=20@Tiezhu, what's your opinion?
>=20
>=20Huacai
>=20
>=20>=20
>=20> Thanks=EF=BC=81
> >=20
>=20>  >
> >  > For uprobes:
> >  >
> >  > I will check the call path again.
> >  >
> >  > For test:
> >  >
> >  > I have already done some tests using BPF tools that utilize kprobe=
s and fentry. I will run more tests using the selftests suite.
> >  >
> >  > Thanks !
> >  > >
> >  > > ---
> >  > > arch/loongarch/Kconfig | 1 +
> >  > > arch/loongarch/kernel/ftrace_dyn.c | 7 ++++++-
> >  > > arch/loongarch/kernel/inst.c | 25 +++++++++++++++++++++----
> >  > > arch/loongarch/kernel/jump_label.c | 3 +++
> >  > > 4 files changed, 31 insertions(+), 5 deletions(-)
> >  > >
> >  > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> >  > > index 606597da46b8..c751d714c287 100644
> >  > > --- a/arch/loongarch/Kconfig
> >  > > +++ b/arch/loongarch/Kconfig
> >  > > @@ -27,6 +27,7 @@ config LOONGARCH
> >  > > select ARCH_HAS_PTE_SPECIAL if 64BIT
> >  > > select ARCH_HAS_SET_MEMORY
> >  > > select ARCH_HAS_SET_DIRECT_MAP
> >  > > + select ARCH_HAS_STRICT_MODULE_RWX
> >  > > select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
> >  > > select ARCH_HAS_UBSAN
> >  > > select ARCH_HAS_VDSO_ARCH_DATA
> >  > > diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch=
/kernel/ftrace_dyn.c
> >  > > index d5d81d74034c..598dc6434cc4 100644
> >  > > --- a/arch/loongarch/kernel/ftrace_dyn.c
> >  > > +++ b/arch/loongarch/kernel/ftrace_dyn.c
> >  > > @@ -8,6 +8,7 @@
> >  > > #include <linux/ftrace.h>
> >  > > #include <linux/kprobes.h>
> >  > > #include <linux/uaccess.h>
> >  > > +#include <linux/memory.h>
> >  > >
> >  > > #include <asm/inst.h>
> >  > > #include <asm/module.h>
> >  > > @@ -24,8 +25,12 @@ static int ftrace_modify_code(unsigned long p=
c, u32 old, u32 new, bool validate)
> >  > > return -EINVAL;
> >  > > }
> >  > >
> >  > > - if (larch_insn_patch_text((void *)pc, new))
> >  > > + mutex_lock(&text_mutex);
> >  > > + if (larch_insn_patch_text((void *)pc, new)) {
> >  > > + mutex_unlock(&text_mutex);
> >  > > return -EPERM;
> >  > > + }
> >  > > + mutex_unlock(&text_mutex);
> >  > >
> >  > > return 0;
> >  > > }
> >  > > diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kerne=
l/inst.c
> >  > > index 0b9228b7c13a..3de94d465c3c 100644
> >  > > --- a/arch/loongarch/kernel/inst.c
> >  > > +++ b/arch/loongarch/kernel/inst.c
> >  > > @@ -6,12 +6,11 @@
> >  > > #include <linux/uaccess.h>
> >  > > #include <linux/set_memory.h>
> >  > > #include <linux/stop_machine.h>
> >  > > +#include <linux/memory.h>
> >  > >
> >  > > #include <asm/cacheflush.h>
> >  > > #include <asm/inst.h>
> >  > >
> >  > > -static DEFINE_RAW_SPINLOCK(patch_lock);
> >  > > -
> >  > > void simu_pc(struct pt_regs *regs, union loongarch_instruction i=
nsn)
> >  > > {
> >  > > unsigned long pc =3D regs->csr_era;
> >  > > @@ -207,14 +206,32 @@ int larch_insn_read(void *addr, u32 *insnp=
)
> >  > > int larch_insn_write(void *addr, u32 insn)
> >  > > {
> >  > > int ret;
> >  > > + int err =3D 0;
> >  > > + size_t start;
> >  > > unsigned long flags =3D 0;
> >  > >
> >  > > if ((unsigned long)addr & 3)
> >  > > return -EINVAL;
> >  > >
> >  > > - raw_spin_lock_irqsave(&patch_lock, flags);
> >  > > + start =3D round_down((size_t)addr, PAGE_SIZE);
> >  > > +
> >  > > + lockdep_assert_held(&text_mutex);
> >  > > +
> >  > > + err =3D set_memory_rw(start, 1);
> >  > > + if (err) {
> >  > > + pr_info("%s: set_memory_rw() failed\n", __func__);
> >  > > + return err;
> >  > > + }
> >  > > +
> >  > > + local_irq_save(flags);
> >  > > ret =3D copy_to_kernel_nofault(addr, &insn, LOONGARCH_INSN_SIZE)=
;
> >  > > - raw_spin_unlock_irqrestore(&patch_lock, flags);
> >  > > + local_irq_restore(flags);
> >  > > +
> >  > > + err =3D set_memory_rox(start, 1);
> >  > > + if (err) {
> >  > > + pr_info("%s: set_memory_rox() failed\n", __func__);
> >  > > + return err;
> >  > > + }
> >  > >
> >  > > return ret;
> >  > > }
> >  > > diff --git a/arch/loongarch/kernel/jump_label.c b/arch/loongarch=
/kernel/jump_label.c
> >  > > index 24a3f4d8540c..e6bb040fe4c5 100644
> >  > > --- a/arch/loongarch/kernel/jump_label.c
> >  > > +++ b/arch/loongarch/kernel/jump_label.c
> >  > > @@ -6,6 +6,7 @@
> >  > > */
> >  > > #include <linux/kernel.h>
> >  > > #include <linux/jump_label.h>
> >  > > +#include <linux/memory.h>
> >  > > #include <asm/cacheflush.h>
> >  > > #include <asm/inst.h>
> >  > >
> >  > > @@ -19,7 +20,9 @@ bool arch_jump_label_transform_queue(struct ju=
mp_entry *entry, enum jump_label_t
> >  > > else
> >  > > insn =3D larch_insn_gen_nop();
> >  > >
> >  > > + mutex_lock(&text_mutex);
> >  > > larch_insn_write(addr, insn);
> >  > > + mutex_unlock(&text_mutex);
> >  > >
> >  > > return true;
> >  > > }
> >  > > --
> >  > > 2.43.0
> >  > >
> >  >
> >
>
