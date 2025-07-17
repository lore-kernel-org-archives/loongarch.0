Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7AA13AD38
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 02:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752720427; cv=none; b=hnm3Bn7QwpO0c0jusZpsuzVhIL0fj//3tAHWKL8haTbc+P39zg3+AGYRto9/FaopcvdJh6+a0Wi/qkahwvM0sp4q6YE6mk9VqtreMVj7YVHnp6dhGPHDVXlWW3SH+mrSS0nGw6L3R6UTlNL0GE94F1gAqLLphpI9YCVqHZX+eI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752720427; c=relaxed/simple;
	bh=159XOLGQMbhQPr8Itrwil41oLZllxAeJUXjGAlM7Ti0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pT3H5MFBCu6YrmoYFoIMjophM4gl+Y2wRcNhYwIDG3vntHnfJPK+KL4wC6QTdqFFhkRy8vo9BoHMVoyGGvqagfkKjqqxnVR7vEee+qaZh37+k4/XtMz72bVU4fzE3u+z+ng9lT80zJgTUt7BWyh9ki5W9LxBOS7vOJv4lUBhjIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4872170862b811f0b29709d653e92f7d-20250717
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, UD_TRUSTED
	CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS, GTI_C_TF, GTI_C_CI
	GTI_FG_IT, GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD
	AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:3834f9ac-4f7d-404d-aa70-ddfb07eeb205,IP:10,
	URL:0,TC:0,Content:6,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:1
X-CID-INFO: VERSION:1.1.45,REQID:3834f9ac-4f7d-404d-aa70-ddfb07eeb205,IP:10,UR
	L:0,TC:0,Content:6,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:1
X-CID-META: VersionHash:6493067,CLOUDID:2710cef7d67c3bf722580f31f439c496,BulkI
	D:250710012009YX0W5DW6,BulkQuantity:16,Recheck:0,SF:17|19|24|44|64|66|78|8
	0|81|82|83|102|841,TC:nil,Content:4|50,EDM:-3,IP:-2,URL:1,File:nil,RT:nil,
	Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR
	:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_OBB,TF_CID_SPAM_ULS,TF_CID_SPAM_SNR,
	TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 4872170862b811f0b29709d653e92f7d-20250717
X-User: duanchenghao@kylinos.cn
Received: from localhost [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 556000329; Thu, 17 Jul 2025 10:46:47 +0800
Date: Thu, 17 Jul 2025 10:46:44 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: Vincent Li <vincent.mc.li@gmail.com>
Cc: yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@kernel.org,
	kernel@xen0n.name, loongarch@lists.linux.dev, guodongtai@kylinos.cn,
	jianghaoran@kylinos.cn
Subject: Re: [PATCH v3 5/5] LoongArch: BPF: Add bpf trampoline support for
 Loongarch
Message-ID: <20250717024644.GA219913@chenghao-pc>
References: <20250709055029.723243-6-duanchenghao@kylinos.cn>
 <CAK3+h2zyhKYjRNV+25pngfrtPQdKe6gJFbkmanBx_9Fp+C8VYw@mail.gmail.com>
 <20250710080456.GB839477@chenghao-pc>
 <CAK3+h2yc6m1c-EpwK+Lmrb9eV7ZbU1ibJHVzygqjc6QjQid7cQ@mail.gmail.com>
 <CAK3+h2yhB3_v8m-5Q0ePDfhH-h1=hK9aCqsN7BHk8NEcwaas5Q@mail.gmail.com>
 <CAK3+h2xZ6yh7N0abu5DP_ftaiE1gQEy8qVi-VvrePssc5+m=eQ@mail.gmail.com>
 <CAK3+h2zPQ+tcFzWzZt8g3TPhaK+7kDnfJQYiDOFMq-K0FqsbTA@mail.gmail.com>
 <CAK3+h2z1iM9m5yyMBNBOO9WcgidW1FKQ+EPVsrM5BRzh5myEPA@mail.gmail.com>
 <CAK3+h2yNfMLHw4x9xi5QKCMKDkkZCa24r-AmMhTe+gCpfpV=Lg@mail.gmail.com>
 <CAK3+h2ym=DawnPnp2Zwx3HKNt7eXO4uxAd+KnQBUPbPdcqSMvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK3+h2ym=DawnPnp2Zwx3HKNt7eXO4uxAd+KnQBUPbPdcqSMvg@mail.gmail.com>

On Wed, Jul 16, 2025 at 03:15:31PM -0700, Vincent Li wrote:
> On Wed, Jul 16, 2025 at 8:35 AM Vincent Li <vincent.mc.li@gmail.com> wrote:
> >
> > On Wed, Jul 16, 2025 at 7:51 AM Vincent Li <vincent.mc.li@gmail.com> wrote:
> > >
> > > On Tue, Jul 15, 2025 at 8:11 PM Vincent Li <vincent.mc.li@gmail.com> wrote:
> > > >
> > > > On Tue, Jul 15, 2025 at 2:54 PM Vincent Li <vincent.mc.li@gmail.com> wrote:
> > > > >
> > > > > On Tue, Jul 15, 2025 at 2:19 PM Vincent Li <vincent.mc.li@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, Jul 10, 2025 at 8:03 AM Vincent Li <vincent.mc.li@gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jul 10, 2025 at 1:05 AM Chenghao Duan <duanchenghao@kylinos.cn> wrote:
> > > > > > > >
> > > > > > > > On Wed, Jul 09, 2025 at 12:08:27PM -0700, Vincent Li wrote:
> > > > > > > > > Hi Chenghao,
> > > > > > > > >
> > > > > > > > > I removed many email recipients for my question because I don't want
> > > > > > > > > to bother others, so you could  reply to this and not CC others who
> > > > > > > > > may not want to be bothered.  Thanks for working on this BPF
> > > > > > > > > trampoline feature for loongarch, I have been waiting for the bpf
> > > > > > > > > trampoline feature for loongarch for a long time.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > On Tue, Jul 8, 2025 at 10:52 PM Chenghao Duan <duanchenghao@kylinos.cn> wrote:
> > > > > > > > > >
> > > > > > > > > > BPF trampoline is the critical infrastructure of the BPF subsystem, acting
> > > > > > > > > > as a mediator between kernel functions and BPF programs. Numerous important
> > > > > > > > > > features, such as using BPF program for zero overhead kernel introspection,
> > > > > > > > > > rely on this key component.
> > > > > > > > > >
> > > > > > > > > > The related tests have passed, Including the following technical points:
> > > > > > > > > > 1. fentry
> > > > > > > > > > 2. fmod_ret
> > > > > > > > > > 3. fexit
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > My firewall project https://github.com/vincentmli/loongfire relies on
> > > > > > > > > https://github.com/xdp-project/xdp-tools/tree/main/lib/libxdp which
> > > > > > > > > relies on "BPF program extension" to attach multiple XDP program to
> > > > > > > > > one single network interface. Now I can't attach multiple XDP programs
> > > > > > > > > to one network interface through libxdp so I use bpf tail call as a
> > > > > > > > > workaround.  I am not a kernel developer and not  familiar with the
> > > > > > > > > kernel code so I am not sure if the "BPF program extension" is
> > > > > > > > > automatically supported after bpf trampoline is supported for
> > > > > > > > > loongarch, could you shed some light on this? thanks!
> > > > > > > > >
> > > > > > > >
> > > > > > > > Hi Vincent,
> > > > > > > >
> > > > > > > > I sincerely apologize, but I'm not quite sure about the specific
> > > > > > > > scenarios where the "BPF Program Extension" you mentioned is applied.
> > > > > > > > The trampoline feature allows multiple BPF programs to be attached to
> > > > > > > > the fentry/fexit points of kernel functions at runtime. I'm not sure if
> > > > > > > > this aligns with your technical approach.
> > > > > > > >
> > > > > > > > Chenghao
> > > > > > > >
> > > > > > >
> > > > > > > Thanks for the feedback, the
> > > > > > > https://github.com/xdp-project/xdp-tools/tree/main/lib/libxdp has
> > > > > > > section
> > > > > > > Kernel and BPF program feature compatibility.
> > > > > > >
> > > > > > > "The ability to attach multiple BPF programs to a single interface
> > > > > > > relies on the kernel “BPF program extension” feature which was
> > > > > > > introduced by commit be8704ff07d2 (“bpf: Introduce dynamic program
> > > > > > > extensions”) in the upstream kernel and first appeared in kernel
> > > > > > > release 5.6. To incrementally attach multiple programs, a further
> > > > > > > refinement added by commit 4a1e7c0c63e0 (“bpf: Support attaching
> > > > > > > freplace programs to multiple attach points”) is needed; this first
> > > > > > > appeared in the upstream kernel version 5.10. The functionality relies
> > > > > > > on the “BPF trampolines” feature which is unfortunately only available
> > > > > > > on the x86_64 architecture. In other words, kernels before 5.6 can
> > > > > > > only attach a single XDP program to each interface, kernels 5.6+ can
> > > > > > > attach multiple programs if they are all attached at the same time,
> > > > > > > and kernels 5.10 have full support for XDP multiprog on x86_64. On
> > > > > > > other architectures, only a single program can be attached to each
> > > > > > > interface."
> > > > > > >
> > > > > > > According to the above mentioned commit and  paragraph, I think “BPF
> > > > > > > program extension” should be  supported if the architecture supports
> > > > > > > trampoline, when libxdp author wrote the above paragraph, probably
> > > > > > > only X86_64 architecture supported BPF trampolines at that time. I
> > > > > > > will be glad to help testing that when loongarch BPF trampoline
> > > > > > > feature is supported :)
> > > > > > >
> > > > > >
> > > > > > I applied the patches on top of 6.16.0-rc6 on my local loongarch
> > > > > > machine, then tried to run xdp-filter program from xdp-tools project,
> > > > > > it looks not working with xdp-tools libxdp, got "Bad address" error:
> > > > > >
> > > > > > ./xdp-filter/xdp-filter load -m skb -vvv lo
> > > > > >
> > > > > >  libxdp: Loaded XDP program xdp_pass, got fd 22
> > > > > >  libxdp: Duplicated fd 22 to 23 for prog xdp_pass
> > > > > >  libxdp: Failed to attach test program to dispatcher: Bad address <====
> > > > > >  libxdp: Compatibility check for dispatcher program failed: Bad address
> > > > > >  libxdp: Falling back to loading single prog without dispatcher
> > > > > >  libxdp: Checking for kernel frags support
> > > > > >  libxdp: Loading XDP program 'xdp-dispatcher.o' from embedded object file
> > > > > >
> > > > > > the error is from xdp-tools lib/libxdp/libxdp.c
> > > > > >
> > > > > >         bpf_program__set_type(test_prog->bpf_prog, BPF_PROG_TYPE_EXT);
> > > > > >         bpf_program__set_expected_attach_type(test_prog->bpf_prog, 0);
> > > > > >         err = xdp_program__load(test_prog);
> > > > > >         if (err) {
> > > > > >                 char buf[100] = {};
> > > > > >                 libxdp_strerror(err, buf, sizeof(buf));
> > > > > >                 pr_debug("Failed to load program %s: %s\n",
> > > > > >                         xdp_program__name(test_prog), buf);
> > > > > >                 goto out;
> > > > > >         }
> > > > > >
> > > > > >         test_prog->link_fd = bpf_raw_tracepoint_open(NULL, test_prog->prog_fd);
> > > > > >         if (test_prog->link_fd < 0) {
> > > > > >                 err = -errno;
> > > > > >                 pr_debug("Failed to attach test program to dispatcher:
> > > > > > %s\n",  <======error Bad address
> > > > > >                          strerror(-err));
> > > > > >                 goto out;
> > > > > >         }
> > > > > >
> > > > >
> > > > > here is strace:
> > > > >
> > > > > 2754  write(2, "libxdp: Duplicated fd 22 to 23 for prog xdp_pass\n", 49) = 49
> > > > > 2754  bpf(BPF_RAW_TRACEPOINT_OPEN, {raw_tracepoint={name=NULL,
> > > > > prog_fd=23}}, 24) = -1 EFAULT (Bad address)
> > > > > 2754  write(2, " ", 1)                  = 1
> > > > > 2754  write(2, "libxdp: Failed to attach test program to dispatcher:
> > > > > Bad address\n", 65) = 65
> > > > >
> > > >
> > > > Sorry to make more noise, if I understand the code right, bpf syscall
> > > > of BPF_RAW_TRACEPOINT_OPEN code path looks like below, and it
> > > > eventually may call bpf_arch_text_poke() which would invoke the
> > > > loongarch bpf_arch_text_poke().  raw tracepoint could rely on the bpf
> > > > trampoline. I wonder if there is a way to print out the kernel stack
> > > > trace when executing xdp-filter command.
> > > >
> > > >
> > > > static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t uattr, unsigned int size)
> > > > {
> > > >         union bpf_attr attr;
> > > >         int err;
> > > > ...
> > > >         case BPF_RAW_TRACEPOINT_OPEN:
> > > >                 err = bpf_raw_tracepoint_open(&attr); <==============
> > > >                 break;
> > > > ...
> > > > }
> > > >
> > > > static int bpf_raw_tracepoint_open(const union bpf_attr *attr)
> > > > {
> > > >         struct bpf_prog *prog;
> > > >         void __user *tp_name;
> > > >         __u64 cookie;
> > > > ...
> > > >         fd = bpf_raw_tp_link_attach(prog, tp_name, cookie); <===========
> > > >                 bpf_prog_put(prog);
> > > > ...
> > > > }
> > > >
> > > > static int bpf_raw_tp_link_attach(struct bpf_prog *prog,
> > > >                                   const char __user *user_tp_name, u64 cookie)
> > > > {
> > > >         struct bpf_link_primer link_primer;
> > > >         struct bpf_raw_tp_link *link;
> > > >         struct bpf_raw_event_map *btp;
> > > >         const char *tp_name;
> > > >         char buf[128];
> > > >         int err;
> > > >
> > > >         switch (prog->type) {
> > > >         case BPF_PROG_TYPE_TRACING:
> > > >         case BPF_PROG_TYPE_EXT: <==========
> > > >         case BPF_PROG_TYPE_LSM:
> > > >                 if (user_tp_name)
> > > >                         /* The attach point for this category of programs
> > > >                          * should be specified via btf_id during program load.
> > > >                          */
> > > >                         return -EINVAL;
> > > >                 if (prog->type == BPF_PROG_TYPE_TRACING &&
> > > >                     prog->expected_attach_type == BPF_TRACE_RAW_TP) {
> > > >                         tp_name = prog->aux->attach_func_name;
> > > >                         break;
> > > >                 }
> > > >                 return bpf_tracing_prog_attach(prog, 0, 0, 0);
> > > > <=====================
> > > > ...
> > > > }
> > > >
> > > >
> > > > static int bpf_tracing_prog_attach(struct bpf_prog *prog,
> > > >                                    int tgt_prog_fd,
> > > >                                    u32 btf_id,
> > > >                                    u64 bpf_cookie)
> > > > {
> > > >
> > > >
> > > >        err = bpf_trampoline_link_prog(&link->link, tr, tgt_prog);
> > > >
> > > > }
> > > >
> > > > int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
> > > >                              struct bpf_trampoline *tr,
> > > >                              struct bpf_prog *tgt_prog)
> > > > {
> > > >         int err;
> > > >
> > > >         mutex_lock(&tr->mutex);
> > > >         err = __bpf_trampoline_link_prog(link, tr, tgt_prog);
> > > >         mutex_unlock(&tr->mutex);
> > > >         return err;
> > > > }
> > > >
> > > > static int __bpf_trampoline_link_prog(struct bpf_tramp_link *link,
> > > >                                       struct bpf_trampoline *tr,
> > > >                                       struct bpf_prog *tgt_prog)
> > > > {
> > > >         enum bpf_tramp_prog_type kind;
> > > >         struct bpf_tramp_link *link_exiting;
> > > >         int err = 0;
> > > >         int cnt = 0, i;
> > > >
> > > >         kind = bpf_attach_type_to_tramp(link->link.prog);
> > > >         if (tr->extension_prog)
> > > >                 /* cannot attach fentry/fexit if extension prog is attached.
> > > >                  * cannot overwrite extension prog either.
> > > >                  */
> > > >                 return -EBUSY;
> > > >
> > > >         for (i = 0; i < BPF_TRAMP_MAX; i++)
> > > >                 cnt += tr->progs_cnt[i];
> > > >
> > > >         if (kind == BPF_TRAMP_REPLACE) { <==========
> > > >                 /* Cannot attach extension if fentry/fexit are in use. */
> > > >                 if (cnt)
> > > >                         return -EBUSY;
> > > >                 err = bpf_freplace_check_tgt_prog(tgt_prog);
> > > >                 if (err)
> > > >                         return err;
> > > >                 tr->extension_prog = link->link.prog;
> > > >                 return bpf_arch_text_poke(tr->func.addr, BPF_MOD_JUMP, NULL,
> > > >                                           link->link.prog->bpf_func);
> > > > <===============
> > > >         }
> > > >
> > > > ...
> > > > }
> > > >
> > >
> > > To continue the fun of hacking :), to find a good use of this patch
> > > series to test out fentry, DeepSeek helped me  come up with the
> > > following method to fentry the bpf_trampoline_link_prog().
> > >
> > > SEC("fentry/bpf_trampoline_link_prog")
> > > int BPF_PROG(trace_trampoline_link,
> > >             struct bpf_tramp_link *link,
> > >             struct bpf_trampoline *tr,
> > >             struct bpf_prog *tgt_prog)
> > > {
> > >     enum bpf_tramp_prog_type kind = BPF_TRAMP_MAX;
> > >     const char *kind_str = "UNKNOWN";
> > >     char prog_name[16] = {0};
> > >     bool has_prog_name = false;
> > >
> > >     if (link && link->link.prog) {
> > >         // Get program name if available
> > >         if (link->link.prog->aux) {
> > >             bpf_probe_read_kernel_str(prog_name, sizeof(prog_name),
> > >                                     link->link.prog->aux->name);
> > >             has_prog_name = true;
> > >         }
> > >
> > >         // Determine kind
> > >         switch (link->link.prog->expected_attach_type) {
> > >             case BPF_TRACE_FENTRY:
> > >                 kind = BPF_TRAMP_FENTRY;
> > >                 kind_str = "FENTRY";
> > >                 break;
> > >             case BPF_TRACE_FEXIT:
> > >                 kind = BPF_TRAMP_FEXIT;
> > >                 kind_str = "FEXIT";
> > >                 break;
> > >             case BPF_MODIFY_RETURN:
> > >                 kind = BPF_TRAMP_MODIFY_RETURN;
> > >                 kind_str = "MODIFY_RETURN";
> > >                 break;
> > >             default:
> > >                 if (link->link.prog->type == BPF_PROG_TYPE_EXT) {
> > >                     kind = BPF_TRAMP_REPLACE;
> > >                     kind_str = "REPLACE";
> > >                 }
> > >                 break;
> > >         }
> > >     }
> > >
> > >     bpf_printk("__bpf_trampoline_link_prog: kind=%d (%s) prog=%s",
> > >                kind,
> > >                kind_str,
> > >                has_prog_name ? prog_name : "N/A");
> > >
> > >     return 0;
> > > }
> > >
> > > It confirms the xdp_pass program is set to  BPF_PROG_TYPE_EXT as
> > > expected and kind is BPF_TRAMP_REPLACE and bpf_arch_text_poke() would
> > > be invoked when I run 'xdp-filter load -m skb lo'
> > >
> > > [root@fedora c]# cat /sys/kernel/debug/tracing/trace_pipe
> > >            <...>-10081   [003] ...11 64926.801233: bpf_trace_printk:
> > > __bpf_trampoline_link_prog: kind=4 (REPLACE) prog=xdp_pass
> > >
> > >
> >
> > I think I found where the error coming from, now I used fentry on the
> > bpf_arch_text_poke()
> >
> > SEC("fentry/bpf_arch_text_poke")
> > int BPF_PROG(trace_text_poke_entry, void *ip, enum bpf_text_poke_type t,
> >              void *old_addr, void *new_addr)
> > {
> >     bpf_printk("bpf_arch_text_poke INVOKED: ip=%pS, type=%d, old=%pS, new=%pS",
> >                ip, t, old_addr, new_addr);
> >     return 0;
> > }
> >
> > SEC("fexit/bpf_arch_text_poke")
> > int BPF_PROG(trace_text_poke_exit,
> >              void *ip, enum bpf_text_poke_type t,
> >              void *old_addr, void *new_addr,
> >              int retval)  // <-- Return value is automatically passed
> > as last arg
> > {
> >     bpf_printk("bpf_arch_text_poke RETURNED: %d (ip=%pS)", retval, ip);
> >     return 0;
> > }
> >
> > it prints:
> > [root@fedora c]# cat /sys/kernel/debug/tracing/trace_pipe
> >            <...>-10426   [001] ...11 67878.110342: bpf_trace_printk:
> > bpf_arch_text_poke INVOKED:
> > ip=bpf_prog_3b185187f1855c4c_xdp_pass+0x0/0x60, type=1, old=0x0,
> > new=bpf_prog_3b185187f1855c4c_xdp_pass+0x0/0x60
> >            <...>-10426   [001] ...11 67878.110350: bpf_trace_printk:
> > bpf_arch_text_poke RETURNED: -14
> > (ip=bpf_prog_3b185187f1855c4c_xdp_pass+0x0/0x60)
> >
> > the error code -14 (-EFAULT) is  likely from line 1434 from this patch
> > series I applied
> >
> > 1417 int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
> > 1418                        void *old_addr, void *new_addr)
> > 1419 {
> > 1420         u32 old_insns[5] = {[0 ... 4] = INSN_NOP};
> > 1421         u32 new_insns[5] = {[0 ... 4] = INSN_NOP};
> > 1422         bool is_call = poke_type == BPF_MOD_CALL;
> > 1423         int ret;
> > 1424
> > 1425         if (!is_kernel_text((unsigned long)ip) &&
> > 1426                 !is_bpf_text_address((unsigned long)ip))
> > 1427                 return -ENOTSUPP;
> > 1428
> > 1429         ret = gen_jump_or_nops(old_addr, ip, old_insns, is_call);
> > 1430         if (ret)
> > 1431                 return ret;
> > 1432
> > 1433         if (memcmp(ip, old_insns, 5 * 4))
> > 1434                 return -EFAULT;
> > 1435
> > 1436         ret = gen_jump_or_nops(new_addr, ip, new_insns, is_call);
> > 1437         if (ret)
> > 1438                 return ret;
> > 1439
> > 1440         mutex_lock(&text_mutex);
> > 1441         if (memcmp(ip, new_insns, 5 * 4))
> > 1442                 ret = larch_insn_text_copy(ip, new_insns, 5 * 4);
> > 1443         mutex_unlock(&text_mutex);
> > 1444         return ret;
> > 1445 }
> >
> 
> in case it helps, I added following diff to print out the ip,
> old_insns before and after ret = gen_jump_or_nops(old_addr, ip,
> old_insns, is_call);
> ip and old_insns do not match before and after
> 
>  [   48.611736] INITIAL: ip [0x02c0840a 0x02ff0063 0x29c0e061
> 0x29c0c076 0x29c0a077]
> [   48.611743] INITIAL: old_insns [0x03400000 0x03400000 0x03400000
> 0x03400000 0x03400000]
> [   48.611745] POST_GEN: old_insns [0x03400000 0x03400000 0x03400000
> 0x03400000 0x03400000]
> [   48.611747] POST_GEN: ip [0x02c0840a 0x02ff0063 0x29c0e061
> 0x29c0c076 0x29c0a077]
> 
> diff below:
> 
> @@ -1426,10 +1432,26 @@ int bpf_arch_text_poke(void *ip, enum
> bpf_text_poke_type poke_type,
>                 !is_bpf_text_address((unsigned long)ip))
>                 return -ENOTSUPP;
> 
> +       /* DEBUG: Print initial state */
> +        pr_info("INITIAL: ip [0x%08x 0x%08x 0x%08x 0x%08x 0x%08x]\n",
> +               ((u32 *)ip)[0], ((u32 *)ip)[1], ((u32 *)ip)[2],
> +               ((u32 *)ip)[3], ((u32 *)ip)[4]);
> +        pr_info("INITIAL: old_insns [0x%08x 0x%08x 0x%08x 0x%08x 0x%08x]\n",
> +               old_insns[0], old_insns[1], old_insns[2],
> +               old_insns[3], old_insns[4]);
> +
>         ret = gen_jump_or_nops(old_addr, ip, old_insns, is_call);
>         if (ret)
>                 return ret;
> 
> +        /* DEBUG: Print post-gen_jump_or_nops */
> +        pr_info("POST_GEN: old_insns [0x%08x 0x%08x 0x%08x 0x%08x 0x%08x]\n",
> +               old_insns[0], old_insns[1], old_insns[2],
> +               old_insns[3], old_insns[4]);
> +        pr_info("POST_GEN: ip [0x%08x 0x%08x 0x%08x 0x%08x 0x%08x]\n",
> +               ((u32 *)ip)[0], ((u32 *)ip)[1], ((u32 *)ip)[2],
> +               ((u32 *)ip)[3], ((u32 *)ip)[4]);
> +
> 

Hi Vincent,

Thank you very much for your testing. We encountered the same situation
when testing fexit_bpf2bpf. After analysis, I think this is not an
issue with the trampoline. The problem you encountered is caused by
the old_addr=NULL passed to the bpf_arch_text_poke function, which
means the old address was not found. We are still analyzing this issue.

Chenghao
> > > >
> > > >
> > > > > deepseek says the  bpf syscall raw tracepoint name should not be NULL,
> > > > > something related to raw tracepoint?
> > > > >
> > > > >
> > > > > > xdp-tools/libxdp is a popular project to attach multiple XDP programs
> > > > > > to a single network interface, packaged in mainstream Linux
> > > > > > distributions, so it would be nice to get the loongarch kernel bpf
> > > > > > trampoline working with xdp-tools/libxdp :).
> > > > > >
> > > > > > > > > > Co-developed-by: George Guo <guodongtai@kylinos.cn>
> > > > > > > > > > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > > > > > > > > > Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> > > > > > > > > > ---
> > > > > > > > > >  arch/loongarch/net/bpf_jit.c | 391 +++++++++++++++++++++++++++++++++++
> > > > > > > > > >  arch/loongarch/net/bpf_jit.h |   6 +
> > > > > > > > > >  2 files changed, 397 insertions(+)
> > > > > > > > > >
> > > > > > > > > > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> > > > > > > > > > index 9cb01f0b0..6820558af 100644
> > > > > > > > > > --- a/arch/loongarch/net/bpf_jit.c
> > > > > > > > > > +++ b/arch/loongarch/net/bpf_jit.c
> > > > > > > > > > @@ -7,6 +7,10 @@
> > > > > > > > > >  #include <linux/memory.h>
> > > > > > > > > >  #include "bpf_jit.h"
> > > > > > > > > >
> > > > > > > > > > +#define LOONGARCH_MAX_REG_ARGS 8
> > > > > > > > > > +#define LOONGARCH_FENTRY_NINSNS 2
> > > > > > > > > > +#define LOONGARCH_FENTRY_NBYTES (LOONGARCH_FENTRY_NINSNS * 4)
> > > > > > > > > > +
> > > > > > > > > >  #define REG_TCC                LOONGARCH_GPR_A6
> > > > > > > > > >  #define TCC_SAVED      LOONGARCH_GPR_S5
> > > > > > > > > >
> > > > > > > > > > @@ -1400,6 +1404,16 @@ static int gen_jump_or_nops(void *target, void *ip, u32 *insns, bool is_call)
> > > > > > > > > >                                   (unsigned long)ip, (unsigned long)target);
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > > +static int emit_call(struct jit_ctx *ctx, u64 addr)
> > > > > > > > > > +{
> > > > > > > > > > +       u64 ip;
> > > > > > > > > > +
> > > > > > > > > > +       if (addr && ctx->image && ctx->ro_image)
> > > > > > > > > > +               ip = (u64)(ctx->image + ctx->idx);
> > > > > > > > > > +
> > > > > > > > > > +       return emit_jump_and_link(ctx, LOONGARCH_GPR_RA, ip, addr);
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > >  int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
> > > > > > > > > >                        void *old_addr, void *new_addr)
> > > > > > > > > >  {
> > > > > > > > > > @@ -1457,3 +1471,380 @@ void *bpf_arch_text_copy(void *dst, void *src, size_t len)
> > > > > > > > > >
> > > > > > > > > >         return dst;
> > > > > > > > > >  }
> > > > > > > > > > +
> > > > > > > > > > +static void store_args(struct jit_ctx *ctx, int nargs, int args_off)
> > > > > > > > > > +{
> > > > > > > > > > +       int i;
> > > > > > > > > > +
> > > > > > > > > > +       for (i = 0; i < nargs; i++) {
> > > > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0 + i, LOONGARCH_GPR_FP, -args_off);
> > > > > > > > > > +               args_off -= 8;
> > > > > > > > > > +       }
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static void restore_args(struct jit_ctx *ctx, int nargs, int args_off)
> > > > > > > > > > +{
> > > > > > > > > > +       int i;
> > > > > > > > > > +
> > > > > > > > > > +       for (i = 0; i < nargs; i++) {
> > > > > > > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0 + i, LOONGARCH_GPR_FP, -args_off);
> > > > > > > > > > +               args_off -= 8;
> > > > > > > > > > +       }
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static int invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
> > > > > > > > > > +                          int args_off, int retval_off,
> > > > > > > > > > +                          int run_ctx_off, bool save_ret)
> > > > > > > > > > +{
> > > > > > > > > > +       int ret;
> > > > > > > > > > +       u32 *branch;
> > > > > > > > > > +       struct bpf_prog *p = l->link.prog;
> > > > > > > > > > +       int cookie_off = offsetof(struct bpf_tramp_run_ctx, bpf_cookie);
> > > > > > > > > > +
> > > > > > > > > > +       if (l->cookie) {
> > > > > > > > > > +               move_imm(ctx, LOONGARCH_GPR_T1, l->cookie, false);
> > > > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -run_ctx_off + cookie_off);
> > > > > > > > > > +       } else {
> > > > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP,
> > > > > > > > > > +                         -run_ctx_off + cookie_off);
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       /* arg1: prog */
> > > > > > > > > > +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> > > > > > > > > > +       /* arg2: &run_ctx */
> > > > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A1, LOONGARCH_GPR_FP, -run_ctx_off);
> > > > > > > > > > +       ret = emit_call(ctx, (const u64)bpf_trampoline_enter(p));
> > > > > > > > > > +       if (ret)
> > > > > > > > > > +               return ret;
> > > > > > > > > > +
> > > > > > > > > > +       /* store prog start time */
> > > > > > > > > > +       move_reg(ctx, LOONGARCH_GPR_S1, LOONGARCH_GPR_A0);
> > > > > > > > > > +
> > > > > > > > > > +       /* if (__bpf_prog_enter(prog) == 0)
> > > > > > > > > > +        *      goto skip_exec_of_prog;
> > > > > > > > > > +        *
> > > > > > > > > > +        */
> > > > > > > > > > +       branch = (u32 *)ctx->image + ctx->idx;
> > > > > > > > > > +       /* nop reserved for conditional jump */
> > > > > > > > > > +       emit_insn(ctx, nop);
> > > > > > > > > > +
> > > > > > > > > > +       /* arg1: &args_off */
> > > > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -args_off);
> > > > > > > > > > +       if (!p->jited)
> > > > > > > > > > +               move_imm(ctx, LOONGARCH_GPR_A1, (const s64)p->insnsi, false);
> > > > > > > > > > +       ret = emit_call(ctx, (const u64)p->bpf_func);
> > > > > > > > > > +       if (ret)
> > > > > > > > > > +               return ret;
> > > > > > > > > > +
> > > > > > > > > > +       if (save_ret) {
> > > > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);
> > > > > > > > > > +               emit_insn(ctx, std, regmap[BPF_REG_0], LOONGARCH_GPR_FP, -(retval_off - 8));
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       /* update branch with beqz */
> > > > > > > > > > +       if (ctx->image) {
> > > > > > > > > > +               int offset = (void *)(&ctx->image[ctx->idx]) - (void *)branch;
> > > > > > > > > > +               *branch = larch_insn_gen_beq(LOONGARCH_GPR_A0, LOONGARCH_GPR_ZERO, offset);
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       /* arg1: prog */
> > > > > > > > > > +       move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
> > > > > > > > > > +       /* arg2: prog start time */
> > > > > > > > > > +       move_reg(ctx, LOONGARCH_GPR_A1, LOONGARCH_GPR_S1);
> > > > > > > > > > +       /* arg3: &run_ctx */
> > > > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_A2, LOONGARCH_GPR_FP, -run_ctx_off);
> > > > > > > > > > +       ret = emit_call(ctx, (const u64)bpf_trampoline_exit(p));
> > > > > > > > > > +
> > > > > > > > > > +       return ret;
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
> > > > > > > > > > +                              int args_off, int retval_off, int run_ctx_off, u32 **branches)
> > > > > > > > > > +{
> > > > > > > > > > +       int i;
> > > > > > > > > > +
> > > > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP, -retval_off);
> > > > > > > > > > +       for (i = 0; i < tl->nr_links; i++) {
> > > > > > > > > > +               invoke_bpf_prog(ctx, tl->links[i], args_off, retval_off,
> > > > > > > > > > +                               run_ctx_off, true);
> > > > > > > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -retval_off);
> > > > > > > > > > +               branches[i] = (u32 *)ctx->image + ctx->idx;
> > > > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > > > +       }
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +u64 bpf_jit_alloc_exec_limit(void)
> > > > > > > > > > +{
> > > > > > > > > > +       return VMALLOC_END - VMALLOC_START;
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +void *arch_alloc_bpf_trampoline(unsigned int size)
> > > > > > > > > > +{
> > > > > > > > > > +       return bpf_prog_pack_alloc(size, jit_fill_hole);
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +void arch_free_bpf_trampoline(void *image, unsigned int size)
> > > > > > > > > > +{
> > > > > > > > > > +       bpf_prog_pack_free(image, size);
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
> > > > > > > > > > +                                        const struct btf_func_model *m,
> > > > > > > > > > +                                        struct bpf_tramp_links *tlinks,
> > > > > > > > > > +                                        void *func_addr, u32 flags)
> > > > > > > > > > +{
> > > > > > > > > > +       int i;
> > > > > > > > > > +       int stack_size = 0, nargs = 0;
> > > > > > > > > > +       int retval_off, args_off, nargs_off, ip_off, run_ctx_off, sreg_off;
> > > > > > > > > > +       struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
> > > > > > > > > > +       struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
> > > > > > > > > > +       struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
> > > > > > > > > > +       int ret, save_ret;
> > > > > > > > > > +       void *orig_call = func_addr;
> > > > > > > > > > +       u32 **branches = NULL;
> > > > > > > > > > +
> > > > > > > > > > +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
> > > > > > > > > > +               return -ENOTSUPP;
> > > > > > > > > > +
> > > > > > > > > > +       /*
> > > > > > > > > > +        * FP + 8       [ RA to parent func ] return address to parent
> > > > > > > > > > +        *                    function
> > > > > > > > > > +        * FP + 0       [ FP of parent func ] frame pointer of parent
> > > > > > > > > > +        *                    function
> > > > > > > > > > +        * FP - 8       [ T0 to traced func ] return address of traced
> > > > > > > > > > +        *                    function
> > > > > > > > > > +        * FP - 16      [ FP of traced func ] frame pointer of traced
> > > > > > > > > > +        *                    function
> > > > > > > > > > +        *
> > > > > > > > > > +        * FP - retval_off  [ return value      ] BPF_TRAMP_F_CALL_ORIG or
> > > > > > > > > > +        *                    BPF_TRAMP_F_RET_FENTRY_RET
> > > > > > > > > > +        *                  [ argN              ]
> > > > > > > > > > +        *                  [ ...               ]
> > > > > > > > > > +        * FP - args_off    [ arg1              ]
> > > > > > > > > > +        *
> > > > > > > > > > +        * FP - nargs_off   [ regs count        ]
> > > > > > > > > > +        *
> > > > > > > > > > +        * FP - ip_off      [ traced func   ] BPF_TRAMP_F_IP_ARG
> > > > > > > > > > +        *
> > > > > > > > > > +        * FP - run_ctx_off [ bpf_tramp_run_ctx ]
> > > > > > > > > > +        *
> > > > > > > > > > +        * FP - sreg_off    [ callee saved reg  ]
> > > > > > > > > > +        *
> > > > > > > > > > +        */
> > > > > > > > > > +
> > > > > > > > > > +       if (m->nr_args > LOONGARCH_MAX_REG_ARGS)
> > > > > > > > > > +               return -ENOTSUPP;
> > > > > > > > > > +
> > > > > > > > > > +       if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
> > > > > > > > > > +               return -ENOTSUPP;
> > > > > > > > > > +
> > > > > > > > > > +       stack_size = 0;
> > > > > > > > > > +
> > > > > > > > > > +       /* room of trampoline frame to store return address and frame pointer */
> > > > > > > > > > +       stack_size += 16;
> > > > > > > > > > +
> > > > > > > > > > +       save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
> > > > > > > > > > +       if (save_ret) {
> > > > > > > > > > +               /* Save BPF R0 and A0 */
> > > > > > > > > > +               stack_size += 16;
> > > > > > > > > > +               retval_off = stack_size;
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       /* room of trampoline frame to store args */
> > > > > > > > > > +       nargs = m->nr_args;
> > > > > > > > > > +       stack_size += nargs * 8;
> > > > > > > > > > +       args_off = stack_size;
> > > > > > > > > > +
> > > > > > > > > > +       /* room of trampoline frame to store args number */
> > > > > > > > > > +       stack_size += 8;
> > > > > > > > > > +       nargs_off = stack_size;
> > > > > > > > > > +
> > > > > > > > > > +       /* room of trampoline frame to store ip address */
> > > > > > > > > > +       if (flags & BPF_TRAMP_F_IP_ARG) {
> > > > > > > > > > +               stack_size += 8;
> > > > > > > > > > +               ip_off = stack_size;
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       /* room of trampoline frame to store struct bpf_tramp_run_ctx */
> > > > > > > > > > +       stack_size += round_up(sizeof(struct bpf_tramp_run_ctx), 8);
> > > > > > > > > > +       run_ctx_off = stack_size;
> > > > > > > > > > +
> > > > > > > > > > +       stack_size += 8;
> > > > > > > > > > +       sreg_off = stack_size;
> > > > > > > > > > +
> > > > > > > > > > +       stack_size = round_up(stack_size, 16);
> > > > > > > > > > +
> > > > > > > > > > +       /* For the trampoline called from function entry */
> > > > > > > > > > +       /* RA and FP for parent function*/
> > > > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -16);
> > > > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
> > > > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
> > > > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 16);
> > > > > > > > > > +
> > > > > > > > > > +       /* RA and FP for traced function*/
> > > > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -stack_size);
> > > > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_size - 8);
> > > > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size - 16);
> > > > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size);
> > > > > > > > > > +
> > > > > > > > > > +       /* callee saved register S1 to pass start time */
> > > > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off);
> > > > > > > > > > +
> > > > > > > > > > +       /* store ip address of the traced function */
> > > > > > > > > > +       if (flags & BPF_TRAMP_F_IP_ARG) {
> > > > > > > > > > +               move_imm(ctx, LOONGARCH_GPR_T1, (const s64)func_addr, false);
> > > > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -ip_off);
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       /* store nargs number*/
> > > > > > > > > > +       move_imm(ctx, LOONGARCH_GPR_T1, nargs, false);
> > > > > > > > > > +       emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -nargs_off);
> > > > > > > > > > +
> > > > > > > > > > +       store_args(ctx, nargs, args_off);
> > > > > > > > > > +
> > > > > > > > > > +       /* To traced function */
> > > > > > > > > > +       orig_call += LOONGARCH_FENTRY_NBYTES;
> > > > > > > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > > > > > > +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false);
> > > > > > > > > > +               ret = emit_call(ctx, (const u64)__bpf_tramp_enter);
> > > > > > > > > > +               if (ret)
> > > > > > > > > > +                       return ret;
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       for (i = 0; i < fentry->nr_links; i++) {
> > > > > > > > > > +               ret = invoke_bpf_prog(ctx, fentry->links[i], args_off, retval_off,
> > > > > > > > > > +                                     run_ctx_off, flags & BPF_TRAMP_F_RET_FENTRY_RET);
> > > > > > > > > > +               if (ret)
> > > > > > > > > > +                       return ret;
> > > > > > > > > > +       }
> > > > > > > > > > +       if (fmod_ret->nr_links) {
> > > > > > > > > > +               branches  = kcalloc(fmod_ret->nr_links, sizeof(u32 *), GFP_KERNEL);
> > > > > > > > > > +               if (!branches)
> > > > > > > > > > +                       return -ENOMEM;
> > > > > > > > > > +
> > > > > > > > > > +               invoke_bpf_mod_ret(ctx, fmod_ret, args_off, retval_off,
> > > > > > > > > > +                                  run_ctx_off, branches);
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > > > > > > +               restore_args(ctx, m->nr_args, args_off);
> > > > > > > > > > +               ret = emit_call(ctx, (const u64)orig_call);
> > > > > > > > > > +               if (ret)
> > > > > > > > > > +                       goto out;
> > > > > > > > > > +               emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);
> > > > > > > > > > +               emit_insn(ctx, std, regmap[BPF_REG_0], LOONGARCH_GPR_FP, -(retval_off - 8));
> > > > > > > > > > +               im->ip_after_call = ctx->ro_image + ctx->idx;
> > > > > > > > > > +               /* Reserve space for the move_imm + jirl instruction */
> > > > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > > > +               emit_insn(ctx, nop);
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       for (i = 0; ctx->image && i < fmod_ret->nr_links; i++) {
> > > > > > > > > > +               int offset = (void *)(&ctx->image[ctx->idx]) - (void *)branches[i];
> > > > > > > > > > +               *branches[i] = larch_insn_gen_bne(LOONGARCH_GPR_T1, LOONGARCH_GPR_ZERO, offset);
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       for (i = 0; i < fexit->nr_links; i++) {
> > > > > > > > > > +               ret = invoke_bpf_prog(ctx, fexit->links[i], args_off, retval_off,
> > > > > > > > > > +                                     run_ctx_off, false);
> > > > > > > > > > +               if (ret)
> > > > > > > > > > +                       goto out;
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > > > > > > > > > +               im->ip_epilogue = ctx->ro_image + ctx->idx;
> > > > > > > > > > +               move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false);
> > > > > > > > > > +               ret = emit_call(ctx, (const u64)__bpf_tramp_exit);
> > > > > > > > > > +               if (ret)
> > > > > > > > > > +                       goto out;
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       if (flags & BPF_TRAMP_F_RESTORE_REGS)
> > > > > > > > > > +               restore_args(ctx, m->nr_args, args_off);
> > > > > > > > > > +
> > > > > > > > > > +       if (save_ret) {
> > > > > > > > > > +               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);
> > > > > > > > > > +               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, -(retval_off - 8));
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off);
> > > > > > > > > > +
> > > > > > > > > > +       /* trampoline called from function entry */
> > > > > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_size - 8);
> > > > > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size - 16);
> > > > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, stack_size);
> > > > > > > > > > +
> > > > > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
> > > > > > > > > > +       emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
> > > > > > > > > > +       emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, 16);
> > > > > > > > > > +
> > > > > > > > > > +       if (flags & BPF_TRAMP_F_SKIP_FRAME)
> > > > > > > > > > +               /* return to parent function */
> > > > > > > > > > +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_RA, 0);
> > > > > > > > > > +       else
> > > > > > > > > > +               /* return to traced function */
> > > > > > > > > > +               emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_T0, 0);
> > > > > > > > > > +
> > > > > > > > > > +       ret = ctx->idx;
> > > > > > > > > > +out:
> > > > > > > > > > +       kfree(branches);
> > > > > > > > > > +
> > > > > > > > > > +       return ret;
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
> > > > > > > > > > +                               void *ro_image_end, const struct btf_func_model *m,
> > > > > > > > > > +                               u32 flags, struct bpf_tramp_links *tlinks,
> > > > > > > > > > +                               void *func_addr)
> > > > > > > > > > +{
> > > > > > > > > > +       int ret;
> > > > > > > > > > +       void *image, *tmp;
> > > > > > > > > > +       u32 size = ro_image_end - ro_image;
> > > > > > > > > > +
> > > > > > > > > > +       image = kvmalloc(size, GFP_KERNEL);
> > > > > > > > > > +       if (!image)
> > > > > > > > > > +               return -ENOMEM;
> > > > > > > > > > +
> > > > > > > > > > +       struct jit_ctx ctx = {
> > > > > > > > > > +               .image = (union loongarch_instruction *)image,
> > > > > > > > > > +               .ro_image = (union loongarch_instruction *)ro_image,
> > > > > > > > > > +               .idx = 0,
> > > > > > > > > > +       };
> > > > > > > > > > +
> > > > > > > > > > +       jit_fill_hole(image, (unsigned int)(ro_image_end - ro_image));
> > > > > > > > > > +       ret = __arch_prepare_bpf_trampoline(&ctx, im, m, tlinks, func_addr, flags);
> > > > > > > > > > +       if (ret > 0 && validate_code(&ctx) < 0) {
> > > > > > > > > > +               ret = -EINVAL;
> > > > > > > > > > +               goto out;
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       tmp = bpf_arch_text_copy(ro_image, image, size);
> > > > > > > > > > +       if (IS_ERR(tmp)) {
> > > > > > > > > > +               ret = PTR_ERR(tmp);
> > > > > > > > > > +               goto out;
> > > > > > > > > > +       }
> > > > > > > > > > +
> > > > > > > > > > +       bpf_flush_icache(ro_image, ro_image_end);
> > > > > > > > > > +out:
> > > > > > > > > > +       kvfree(image);
> > > > > > > > > > +       return ret < 0 ? ret : size;
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
> > > > > > > > > > +                            struct bpf_tramp_links *tlinks, void *func_addr)
> > > > > > > > > > +{
> > > > > > > > > > +       struct bpf_tramp_image im;
> > > > > > > > > > +       struct jit_ctx ctx;
> > > > > > > > > > +       int ret;
> > > > > > > > > > +
> > > > > > > > > > +       ctx.image = NULL;
> > > > > > > > > > +       ctx.idx = 0;
> > > > > > > > > > +
> > > > > > > > > > +       ret = __arch_prepare_bpf_trampoline(&ctx, &im, m, tlinks, func_addr, flags);
> > > > > > > > > > +
> > > > > > > > > > +       /* Page align */
> > > > > > > > > > +       return ret < 0 ? ret : round_up(ret * LOONGARCH_INSN_SIZE, PAGE_SIZE);
> > > > > > > > > > +}
> > > > > > > > > > diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
> > > > > > > > > > index f9c569f53..5697158fd 100644
> > > > > > > > > > --- a/arch/loongarch/net/bpf_jit.h
> > > > > > > > > > +++ b/arch/loongarch/net/bpf_jit.h
> > > > > > > > > > @@ -18,6 +18,7 @@ struct jit_ctx {
> > > > > > > > > >         u32 *offset;
> > > > > > > > > >         int num_exentries;
> > > > > > > > > >         union loongarch_instruction *image;
> > > > > > > > > > +       union loongarch_instruction *ro_image;
> > > > > > > > > >         u32 stack_size;
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > > @@ -308,3 +309,8 @@ static inline int emit_tailcall_jmp(struct jit_ctx *ctx, u8 cond, enum loongarch
> > > > > > > > > >
> > > > > > > > > >         return -EINVAL;
> > > > > > > > > >  }
> > > > > > > > > > +
> > > > > > > > > > +static inline void bpf_flush_icache(void *start, void *end)
> > > > > > > > > > +{
> > > > > > > > > > +       flush_icache_range((unsigned long)start, (unsigned long)end);
> > > > > > > > > > +}
> > > > > > > > > > --
> > > > > > > > > > 2.43.0
> > > > > > > > > >
> > > > > > > > > >
