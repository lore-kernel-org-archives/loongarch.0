Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C6F2E6122
	for <loongarch@lists.linux.dev>; Tue, 12 Aug 2025 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987698; cv=none; b=WYZ3amNjW72Add4FDVekeZyWcLP9yBRKJXFMqRmdVUIPCo3tWeEBiDg65OEE7WE3viToXkZCnhPIpkUzhYn7h4AAlf+u3LWzDbPAg96dCANoWA4x4j47Pvb1b1xFaW8alOo94OKZQZE62gLklV7EWVeKNh98afuMomioAqXJJTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987698; c=relaxed/simple;
	bh=LDA1m6Z5pacT4YeVu5E/9EFkB98z6lfDXiTT0pkenxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unzQeBnywbc39Ez47xTgwZYFNYbhU8g0z7fJefAFLd8jVkVcz7glAzYMqbSsLNpO64+7fnxMHKUZ7xQSWSoo4VihCknKWXnnwxJchN36UswXYE0scqfZzkjTdc1IBzrr4orBDG2rPcZDjMZ0utWkHy5QM63OAVctljWDKxkTl9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 34a1b32e775711f0b29709d653e92f7d-20250812
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:74ae1790-42c6-4610-b655-cba9e9837a1a,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.45,REQID:74ae1790-42c6-4610-b655-cba9e9837a1a,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:1794b6c8040478476dd70592739a6896,BulkI
	D:2508091148269AKA4902,BulkQuantity:5,Recheck:0,SF:17|19|24|44|64|66|78|80
	|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,B
	ulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:
	0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 34a1b32e775711f0b29709d653e92f7d-20250812
X-User: duanchenghao@kylinos.cn
Received: from localhost [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1023269190; Tue, 12 Aug 2025 16:34:47 +0800
Date: Tue, 12 Aug 2025 16:34:41 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: Vincent Li <vincent.mc.li@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: kernel lockup on bpf selftests module_attach
Message-ID: <20250812083441.GA1119757@chenghao-pc>
References: <CAK3+h2x_N-UnQqz_=bQOK9vB8fxEU=4YQ3YwCpnMNW4i5uBkQg@mail.gmail.com>
 <CAAhV-H7wOZUJfn4pP2bV0G8Hnt2AfXt1ZL-eY5FFnQs4XF8g8Q@mail.gmail.com>
 <CAK3+h2y003+3Ts+5PjVaxhYc8KM74B+3mSJ-hCt+Gmmta8Rbww@mail.gmail.com>
 <CAK3+h2zSSW2EF88twhRNTG-QjsuX3ZeR+a8GVh80hOD50mdE6w@mail.gmail.com>
 <CAAhV-H7QEidF7piHYJ0ZZD5FRp11ytBq+Q2YvpfZUPvS_BHTgQ@mail.gmail.com>
 <CAK3+h2zq5ePgh5YDrMpb4GRsN-3kO=1AM4C057EZkB4OVRpKpw@mail.gmail.com>
 <CAK3+h2wcOQr0iv=-K7WOCQkMkQb7b6gR77W7GSwuVqJuvc+fxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK3+h2wcOQr0iv=-K7WOCQkMkQb7b6gR77W7GSwuVqJuvc+fxQ@mail.gmail.com>

On Sun, Aug 10, 2025 at 10:39:24AM -0700, Vincent Li wrote:
> Hi Chenghao,
> 
> On Sat, Aug 9, 2025 at 12:11 PM Vincent Li <vincent.mc.li@gmail.com> wrote:
> >
> > On Fri, Aug 8, 2025 at 11:03 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > >
> > > Hi, Chenghao,
> > >
> > > Please take a look.
> > >
> > > Huacai
> > >
> > I reverted loongson-next branch  tailcall count fix patches, struct
> > ops trampoline patch, keep the rest of trampoline patches,
> > module_attach test experienced the same issue, so definitely
> > trampoline patches issue.
> >
> 
> I attempted to isolate which test in module_attach triggers the
> "Unable to handle kernel paging request..." error, it appears to be
> this one in "prog_tests/module_attach.c"
> 
> ASSERT_OK(trigger_module_test_read(READ_SZ), "trigger_read");
> 
> you can try to comment out other tests in "prog_tests/module_attach.c"
> and perform the test, it might help isolate the issue.
> 

Hi Vincent,

The results I tested are different from yours. Could there be other
differences between us? I am using the latest code of the loongarch-next
branch.

[root@localhost bpf]# ./test_progs -v -t module_attach
bpf_testmod.ko is already unloaded.
Loading bpf_testmod.ko...
Successfully loaded bpf_testmod.ko.
test_module_attach:PASS:skel_open 0 nsec
test_module_attach:PASS:set_attach_target 0 nsec
test_module_attach:PASS:set_attach_target_explicit 0 nsec
WATCHDOG: test case module_attach executes for 10 seconds...
libbpf: prog 'handle_fmod_ret': BPF program load failed: -EINVAL
libbpf: prog 'handle_fmod_ret': -- BEGIN PROG LOAD LOG --
bpf_testmod_test_read() is not modifiable
processed 0 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
-- END PROG LOAD LOG --
libbpf: prog 'handle_fmod_ret': failed to load: -EINVAL
libbpf: failed to load object 'test_module_attach'
libbpf: failed to load BPF skeleton 'test_module_attach': -EINVAL
test_module_attach:FAIL:skel_load failed to load skeleton
#205     module_attach:FAIL
Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
Successfully unloaded bpf_testmod.ko.



Chenghao

> 
> > > On Sat, Aug 9, 2025 at 1:03 PM Vincent Li <vincent.mc.li@gmail.com> wrote:
> > > >
> > > > On Fri, Aug 8, 2025 at 8:48 PM Vincent Li <vincent.mc.li@gmail.com> wrote:
> > > > >
> > > > > On Fri, Aug 8, 2025 at 8:03 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > > >
> > > > > > Hi, Vincent,
> > > > > >
> > > > > > On Sat, Aug 9, 2025 at 12:53 AM Vincent Li <vincent.mc.li@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi Folks,
> > > > > > >
> > > > > > > Hengqi mentioned offline that the loongarch kernel locked up when
> > > > > > > running full bpf selftests, so I went ahead and ran make run_tests to
> > > > > > > perform full bpf selftest, I observed lockup too. It appears the
> > > > > > > lockup happens when running module_attach test which includes testing
> > > > > > > on fentry so this could be related to the trampoline patch series. for
> > > > > > > example, if I just run ./test_progs -t module_attach, the kernel
> > > > > > > lockup immediately.
> > > > > > Is this a regression caused by the latest trampoline patches? Or in
> > > > > > another word, Does vanilla 6.16 has this problem?
> > > > > >
> > > > >
> > > > > I suspect this is caused by the latest trampoline patches because the
> > > > > module_attach is to test the fentry feature for kernel module
> > > > > functions, I believe Changhao and I only tested the fentry feature for
> > > > > non-module kernel functions. I can try kernel without the trampoline
> > > > > patches and will let you know the result.
> > > > >
> > > >
> > > > I reverted  trampoline patches from loongarch-next branch and run
> > > > ./test_progs -t module_attach simply just errors out with the fentry
> > > > feature not supported
> > > >
> > > > [root@fedora bpf]# ./test_progs -t module_attach
> > > > test_module_attach:PASS:skel_open 0 nsec
> > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > test_module_attach:PASS:skel_load 0 nsec
> > > > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > > > libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
> > > > test_module_attach:FAIL:skel_attach skeleton attach failed: -524
> > > > #205     module_attach:FAIL
> > > >
> > > > All error logs:
> > > > test_module_attach:PASS:skel_open 0 nsec
> > > > test_module_attach:PASS:set_attach_target 0 nsec
> > > > test_module_attach:PASS:set_attach_target_explicit 0 nsec
> > > > test_module_attach:PASS:skel_load 0 nsec
> > > > libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
> > > > libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
> > > > test_module_attach:FAIL:skel_attach skeleton attach failed: -524
> > > > #205     module_attach:FAIL
> > > > Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
> > > >
> > > > I also tested loongarch-next branch with the trampoline patch series
> > > > with no lockup kernel config so I can run dmesg to check kernel error
> > > > log,  ./test_progs -t module_attach result in below kernel log:
> > > >
> > > > [  417.429954] bpf_testmod: loading out-of-tree module taints kernel.
> > > > [  419.728620] CPU 70475748 Unable to handle kernel paging request at
> > > > virtual address 0000000800000024, era == 90000000041d5854, ra ==
> > > > 90000000041d5848
> > > > [  419.728629] Oops[#1]:
> > > > [  419.728632] CPU 70475748 Unable to handle kernel paging request at
> > > > virtual address 0000000000000018, era == 9000000005750268, ra ==
> > > > 9000000004163938
> > > > [  441.305370] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> > > > [  441.305380] rcu:     5-...0: (29 ticks this GP)
> > > > idle=eb74/1/0x4000000000000000 softirq=72377/72379 fqs=2599
> > > > [  441.305386] rcu:     (detected by 4, t=5252 jiffies, g=60333, q=186 ncpus=8)
> > > > [  441.305390] Sending NMI from CPU 4 to CPUs 5:
> > > > [  451.305494] rcu: rcu_preempt kthread starved for 2499 jiffies!
> > > > g60333 f0x0 RCU_GP_DOING_FQS(6) ->state=0x0 ->cpu=1
> > > > [  451.305500] rcu:     Unless rcu_preempt kthread gets sufficient CPU
> > > > time, OOM is now expected behavior.
> > > > [  451.305502] rcu: RCU grace-period kthread stack dump:
> > > > [  451.305504] task:rcu_preempt     state:R stack:0     pid:15
> > > > tgid:15    ppid:2      task_flags:0x208040 flags:0x00000800
> > > > [  451.305510] Stack : 9000000100467e80 0000000000000402
> > > > 0000000000000010 90000001003b0680
> > > > [  451.305519]         90000000058e0000 0000000000000000
> > > > 0000000000000040 9000000006c2dfd0
> > > > [  451.305526]         900000000578c9b0 0000000000000001
> > > > 9000000006b21000 0000000000000005
> > > > [  451.305533]         00000001000093a8 00000001000093a8
> > > > 0000000000000000 0000000000000004
> > > > [  451.305540]         90000000058f04e0 0000000000000000
> > > > 0000000000000002 b793724be1dfb2b8
> > > > [  451.305547]         00000001000093a9 b793724be1dfb2b8
> > > > 000000000000003f 9000000006c2dfd0
> > > > [  451.305554]         9000000006c30c18 0000000000000005
> > > > 9000000006b0e000 9000000006b21000
> > > > [  451.305560]         9000000100453c98 90000001003aff80
> > > > 9000000006c31140 900000000578c9b0
> > > > [  451.305567]         00000001000093a8 9000000005794d3c
> > > > 00000000000000b4 0000000000000000
> > > > [  451.305574]         90000000024021b8 00000001000093a8
> > > > 9000000004284f20 000000000a400001
> > > > [  451.305581]         ...
> > > > [  451.305584] Call Trace:
> > > > [  451.305586] [<900000000578b868>] __schedule+0x410/0x1520
> > > > [  451.305595] [<900000000578c9ac>] schedule+0x34/0x190
> > > > [  451.305599] [<9000000005794d38>] schedule_timeout+0x98/0x140
> > > > [  451.305604] [<9000000004258f40>] rcu_gp_fqs_loop+0x5f8/0x868
> > > > [  451.305609] [<900000000425d358>] rcu_gp_kthread+0x260/0x2e0
> > > > [  451.305614] [<90000000041be704>] kthread+0x144/0x238
> > > > [  451.305619] [<9000000005787b60>] ret_from_kernel_thread+0x28/0xc8
> > > > [  451.305624] [<90000000041620e4>] ret_from_kernel_thread_asm+0xc/0x88
> > > >
> > > > [  451.305630] rcu: Stack dump where RCU GP kthread last ran:
> > > > [  451.305633] Sending NMI from CPU 4 to CPUs 1:
> > > > [  451.305636] NMI backtrace for cpu 1 skipped: idling at idle_exit+0x0/0x4
> > > > [  451.306655] rcu: INFO: rcu_preempt detected expedited stalls on
> > > > CPUs/tasks: { 5-...D } 7298 jiffies s: 853 root: 0x20/.
> > > > [  451.306665] rcu: blocking rcu_node structures (internal RCU debug):
> > > > [  451.306669] Sending NMI from CPU 6 to CPUs 5:
> > > > [  451.306672] Unable to send backtrace IPI to CPU5 - perhaps it hung?
> > > >
> > > > So related to trampoline patches for sure unless I am missing something.
> > > >
> > > > > > Huacai
> > > > > >
> > > > > > >
> > > > > > > A side note, if I put the module_attach test in
> > > > > > > tools/testing/selftests/bpf/DENYLIST to skip the module_attach test,
> > > > > > > the module_attach test is not skipped.
> > > > > > >
> > > > > > > Thanks
> > > > > > >
> > > > > > > Vincent
