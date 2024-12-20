Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F63710F1
	for <loongarch@lists.linux.dev>; Fri, 20 Dec 2024 05:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734670950; cv=none; b=Pjx40uIjp1/bnfyBPtLrZxCRG4lhK/uoSHwZxmeTFAfXmlyXoJcQdrD8uY/1gd5Kzo4uaR0GgOdx8DGrFF7iYuvoO2Rj6+eABS1uLYXG9O7pwPziBLCv9PNDrlP2YY4MoRvpLmruGwDn0edt6ykvKNu8V89eMJMdJC03CvJsrSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734670950; c=relaxed/simple;
	bh=VB3XXIHg4Wil2ObIwzUYqcGzfWANQn7+XIlT/sQ00Ak=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=AKHFv9+oPNZiKgVbbHizbk/n2KsnSDpxb/DVufed7OmLS4LYmXEtDrC8qdv2EB11yd1Qqug/bfG/YBBHGWInMJr1R3MGQ2mLkU2lvAg/NcVG/NVstw/1ccBqZ7zAdR5exZXv37gjektThth+6NjWM7ZPL110Ht9dyn2D9hop5ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxfa9d+mRnPtlYAA--.19329S3;
	Fri, 20 Dec 2024 13:02:21 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxbcda+mRnGTADAA--.18880S3;
	Fri, 20 Dec 2024 13:02:18 +0800 (CST)
Subject: Re: [PATCH v6 9/9] drm/amd/display: Mark dc_fixpt_from_fraction()
 noinline
To: Alex Deucher <alexdeucher@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <20241217015006.30305-1-yangtiezhu@loongson.cn>
 <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>
 <20241218190558.g2hykmjgbny4n5i3@jpoimboe>
 <CADnq5_PFcHzob4poLa86_K4yP5gUT7Ei4Rz5vSUofvZTmB48-g@mail.gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <4bace457-cc26-13a3-bc90-ad6ad12bc2ed@loongson.cn>
Date: Fri, 20 Dec 2024 13:02:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADnq5_PFcHzob4poLa86_K4yP5gUT7Ei4Rz5vSUofvZTmB48-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxbcda+mRnGTADAA--.18880S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9fXoW3CF13Cw18GrWfWFy3uFykZwc_yoW8GF15Xo
	W5Z34YqF4xGryDWF9a9ryUJr4kZa18ZFn7tFn3XwnxGFn8XFW8Xr15uw18Ka1SgF45Xay7
	Cay7tr45A3WjkFn7l-sFpf9Il3svdjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYx7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r
	1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1
	WlkUUUUU=

On 12/19/2024 03:22 AM, Alex Deucher wrote:
> On Wed, Dec 18, 2024 at 2:18 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>>
>> On Wed, Dec 18, 2024 at 10:36:00PM +0800, Huacai Chen wrote:
>>> Hi, Tiezhu,
>>>
>>> On Tue, Dec 17, 2024 at 9:50 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>>>
>>>> When compiling with Clang on LoongArch, there exists the following objtool
>>>> warning in drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.o:
>>>>
>>>>   dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
>>>>
>>>> This is because dc_fixpt_from_fraction() is inlined in dc_fixpt_recip()
>>>> by Clang, given dc_fixpt_from_fraction() is not a simple function, just
>>>> mark it noinline to avoid the above issue.
>>> I don't know whether drm maintainers can accept this, because it looks
>>> like a workaround. Yes, uninline this function "solve" a problem and
>>> seems reasonable in this case because the function is "not simple",
>>> but from another point of view, you may hide a type of bug.
>>
>> Agreed, it sounds like there's definitely a bug which this patch is
>> papering over.
>
> Yes, agreed.

Additional Info:

In order to avoid the effect of this series, I tested with kernel
6.13-rc3 without this series again.

--------------------------------------------------------------------------
Here are the test result.

1. For LoongArch

"dc_fixpt_recip() falls through to next function dc_fixpt_sinc()"
objtool warning only appears compiled with the latest mainline LLVM,
there is no this issue compiled with the latest release version such
as LLVM 19.1.6.

(1) objdump info with LLVM release version 19.1.6:

$ clang --version | head -1
clang version 19.1.6

There is an jump instruction "b" at the end of dc_fixpt_recip(), it
maybe jumps to a position and then steps to the return instruction, so
there is no "falls through" objtool warning.

0000000000000200 <dc_fixpt_recip>:
      200:       40009480        beqz            $a0, 148        # 294 
<dc_fixpt_recip+0x94>
      204:       0049fc85        srai.d          $a1, $a0, 0x3f
      208:       00159486        xor             $a2, $a0, $a1
      20c:       001194c5        sub.d           $a1, $a2, $a1
      210:       03800007        ori             $a3, $zero, 0x0
      214:       16000027        lu32i.d         $a3, 1
      218:       002314e6        div.du          $a2, $a3, $a1
      21c:       001d94c8        mul.d           $a4, $a2, $a1
      220:       0011a0e9        sub.d           $a5, $a3, $a4
      224:       02bf8008        addi.w          $a4, $zero, -32
      228:       03400000        andi            $zero, $zero, 0x0
      22c:       03400000        andi            $zero, $zero, 0x0
      230:       00410529        slli.d          $a5, $a5, 0x1
      234:       004104c6        slli.d          $a2, $a2, 0x1
      238:       0012952a        sltu            $a6, $a5, $a1
      23c:       03c0054a        xori            $a6, $a6, 0x1
      240:       001328ab        maskeqz         $a7, $a1, $a6
      244:       0011ad29        sub.d           $a5, $a5, $a7
      248:       00df0108        bstrpick.d      $a4, $a4, 0x1f, 0x0
      24c:       02c00508        addi.d          $a4, $a4, 1
      250:       00149d0b        and             $a7, $a4, $a3
      254:       001528c6        or              $a2, $a2, $a6
      258:       43ffd97f        beqz            $a7, -40        # 230 
<dc_fixpt_recip+0x30>
      25c:       00410527        slli.d          $a3, $a5, 0x1
      260:       001294e5        sltu            $a1, $a3, $a1
      264:       03c004a5        xori            $a1, $a1, 0x1
      268:       02bffc07        addi.w          $a3, $zero, -1
      26c:       031ffce7        lu52i.d         $a3, $a3, 2047
      270:       00159ca7        xor             $a3, $a1, $a3
      274:       680030e6        bltu            $a3, $a2, 48    # 2a4 
<dc_fixpt_recip+0xa4>
      278:       001094c5        add.d           $a1, $a2, $a1
      27c:       00119406        sub.d           $a2, $zero, $a1
      280:       02000084        slti            $a0, $a0, 0
      284:       001390a5        masknez         $a1, $a1, $a0
      288:       001310c4        maskeqz         $a0, $a2, $a0
      28c:       00151484        or              $a0, $a0, $a1
      290:       4c000020        jirl            $zero, $ra, 0
      294:       00150005        or              $a1, $zero, $zero
      298:       002a0001        break           0x1
      29c:       002a0001        break           0x1
      2a0:       53ff73ff        b               -144    # 210 
<dc_fixpt_recip+0x10>
      2a4:       002a0001        break           0x1
      2a8:       53ffd3ff        b               -48     # 278 
<dc_fixpt_recip+0x78>
      2ac:       03400000        andi            $zero, $zero, 0x0
      2b0:       03400000        andi            $zero, $zero, 0x0
      2b4:       03400000        andi            $zero, $zero, 0x0
      2b8:       03400000        andi            $zero, $zero, 0x0
      2bc:       03400000        andi            $zero, $zero, 0x0

00000000000002c0 <dc_fixpt_sinc>:
      2c0:       0049fc85        srai.d          $a1, $a0, 0x3f
      2c4:       00159486        xor             $a2, $a0, $a1
      2c8:       1490fda7        lu12i.w         $a3, 296941
      2cc:       039444e7        ori             $a3, $a3, 0x511
      2d0:       001194c6        sub.d           $a2, $a2, $a1
      2d4:       001500e5        or              $a1, $a3, $zero
      2d8:       160000c5        lu32i.d         $a1, 6
      2dc:       001500c9        or              $a5, $a2, $zero
      2e0:       00150088        or              $a4, $a0, $zero
      2e4:       6000a8c5        blt             $a2, $a1, 168   # 38c 
<dc_fixpt_sinc+0xcc>

(2) objdump info with LLVM mainline version 20.0.0git:

$ clang --version | head -1
clang version 20.0.0git (https://github.com/llvm/llvm-project.git 
8daf4f16fa08b5d876e98108721dd1743a360326)

There is "break" instruction at the end of dc_fixpt_recip(), its offset
is "2a0", this "break" instruction is not dead end due to the offset
"2a4" is in the relocation section '.rela.discard.reachable', that is
to say, dc_fixpt_recip() doesn't end with a return instruction or an
unconditional jump, so objtool determined that the function can fall
through into the next function, thus there is "falls through" objtool
warning.

0000000000000200 <dc_fixpt_recip>:
      200:       40009c80        beqz            $a0, 156        # 29c 
<dc_fixpt_recip+0x9c>
      204:       0049fc85        srai.d          $a1, $a0, 0x3f
      208:       00159486        xor             $a2, $a0, $a1
      20c:       001194c5        sub.d           $a1, $a2, $a1
      210:       03800007        ori             $a3, $zero, 0x0
      214:       16000027        lu32i.d         $a3, 1
      218:       002314e6        div.du          $a2, $a3, $a1
      21c:       001d94c8        mul.d           $a4, $a2, $a1
      220:       0011a0e9        sub.d           $a5, $a3, $a4
      224:       02bf8008        addi.w          $a4, $zero, -32
      228:       03400000        andi            $zero, $zero, 0x0
      22c:       03400000        andi            $zero, $zero, 0x0
      230:       00410529        slli.d          $a5, $a5, 0x1
      234:       004104c6        slli.d          $a2, $a2, 0x1
      238:       0012952a        sltu            $a6, $a5, $a1
      23c:       03c0054a        xori            $a6, $a6, 0x1
      240:       001328ab        maskeqz         $a7, $a1, $a6
      244:       0011ad29        sub.d           $a5, $a5, $a7
      248:       00df0108        bstrpick.d      $a4, $a4, 0x1f, 0x0
      24c:       02c00508        addi.d          $a4, $a4, 1
      250:       00149d0b        and             $a7, $a4, $a3
      254:       001528c6        or              $a2, $a2, $a6
      258:       43ffd97f        beqz            $a7, -40        # 230 
<dc_fixpt_recip+0x30>
      25c:       00410527        slli.d          $a3, $a5, 0x1
      260:       001294e5        sltu            $a1, $a3, $a1
      264:       03c004a5        xori            $a1, $a1, 0x1
      268:       02bffc07        addi.w          $a3, $zero, -1
      26c:       031ffce7        lu52i.d         $a3, $a3, 2047
      270:       00159ca7        xor             $a3, $a1, $a3
      274:       680020e6        bltu            $a3, $a2, 32    # 294 
<dc_fixpt_recip+0x94>
      278:       001094c5        add.d           $a1, $a2, $a1
      27c:       00119406        sub.d           $a2, $zero, $a1
      280:       02000084        slti            $a0, $a0, 0
      284:       001390a5        masknez         $a1, $a1, $a0
      288:       001310c4        maskeqz         $a0, $a2, $a0
      28c:       00151484        or              $a0, $a0, $a1
      290:       4c000020        jirl            $zero, $ra, 0
      294:       002a0001        break           0x1
      298:       53ffe3ff        b               -32     # 278 
<dc_fixpt_recip+0x78>
      29c:       002a0001        break           0x1
      2a0:       002a0001        break           0x1
      2a4:       03400000        andi            $zero, $zero, 0x0
      2a8:       03400000        andi            $zero, $zero, 0x0
      2ac:       03400000        andi            $zero, $zero, 0x0
      2b0:       03400000        andi            $zero, $zero, 0x0
      2b4:       03400000        andi            $zero, $zero, 0x0
      2b8:       03400000        andi            $zero, $zero, 0x0
      2bc:       03400000        andi            $zero, $zero, 0x0

00000000000002c0 <dc_fixpt_sinc>:
      2c0:       0049fc85        srai.d          $a1, $a0, 0x3f
      2c4:       00159486        xor             $a2, $a0, $a1
      2c8:       001194c6        sub.d           $a2, $a2, $a1
      2cc:       1490fda5        lu12i.w         $a1, 296941
      2d0:       039444a5        ori             $a1, $a1, 0x511
      2d4:       160000c5        lu32i.d         $a1, 6
      2d8:       001500c7        or              $a3, $a2, $zero
      2dc:       00150088        or              $a4, $a0, $zero
      2e0:       600090c5        blt             $a2, $a1, 144   # 370 
<dc_fixpt_sinc+0xb0>

2. For x86

I tested with LLVM 19.1.6 and the latest mainline LLVM, the test result
is same with LoongArch.

(1) objdump info with LLVM release version 19.1.6:

$ clang --version | head -1
clang version 19.1.6

There is an jump instruction "jmp" at the end of dc_fixpt_recip(), it
maybe jumps to a position and then steps to the return instruction, so
there is no "falls through" objtool warning.

0000000000000290 <dc_fixpt_recip>:
      290:       f3 0f 1e fa             endbr64
      294:       e8 00 00 00 00          call   299 <dc_fixpt_recip+0x9>
      299:       48 85 ff                test   %rdi,%rdi
      29c:       0f 84 a8 00 00 00       je     34a <dc_fixpt_recip+0xba>
      2a2:       48 89 f9                mov    %rdi,%rcx
      2a5:       48 f7 d9                neg    %rcx
      2a8:       48 0f 48 cf             cmovs  %rdi,%rcx
      2ac:       53                      push   %rbx
      2ad:       48 b8 00 00 00 00 01    movabs $0x100000000,%rax
      2b4:       00 00 00
      2b7:       31 d2                   xor    %edx,%edx
      2b9:       48 f7 f1                div    %rcx
      2bc:       be e0 ff ff ff          mov    $0xffffffe0,%esi
      2c1:       eb 1b                   jmp    2de <dc_fixpt_recip+0x4e>
      2c3:       45 88 c8                mov    %r9b,%r8b
      2c6:       4d 01 c0                add    %r8,%r8
      2c9:       4d 8d 04 80             lea    (%r8,%rax,4),%r8
      2cd:       48 29 da                sub    %rbx,%rdx
      2d0:       45 88 da                mov    %r11b,%r10b
      2d3:       4c 89 d0                mov    %r10,%rax
      2d6:       4c 09 c0                or     %r8,%rax
      2d9:       83 c6 02                add    $0x2,%esi
      2dc:       74 31                   je     30f <dc_fixpt_recip+0x7f>
      2de:       48 01 d2                add    %rdx,%rdx
      2e1:       45 31 c0                xor    %r8d,%r8d
      2e4:       41 ba 00 00 00 00       mov    $0x0,%r10d
      2ea:       48 39 ca                cmp    %rcx,%rdx
      2ed:       41 0f 93 c1             setae  %r9b
      2f1:       72 03                   jb     2f6 <dc_fixpt_recip+0x66>
      2f3:       49 89 ca                mov    %rcx,%r10
      2f6:       4c 29 d2                sub    %r10,%rdx
      2f9:       48 01 d2                add    %rdx,%rdx
      2fc:       45 31 d2                xor    %r10d,%r10d
      2ff:       48 89 cb                mov    %rcx,%rbx
      302:       48 39 ca                cmp    %rcx,%rdx
      305:       41 0f 93 c3             setae  %r11b
      309:       73 b8                   jae    2c3 <dc_fixpt_recip+0x33>
      30b:       31 db                   xor    %ebx,%ebx
      30d:       eb b4                   jmp    2c3 <dc_fixpt_recip+0x33>
      30f:       48 01 d2                add    %rdx,%rdx
      312:       48 be fe ff ff ff ff    movabs $0x7ffffffffffffffe,%rsi
      319:       ff ff 7f
      31c:       4c 8d 46 01             lea    0x1(%rsi),%r8
      320:       48 39 ca                cmp    %rcx,%rdx
      323:       4c 0f 43 c6             cmovae %rsi,%r8
      327:       4c 39 c0                cmp    %r8,%rax
      32a:       77 29                   ja     355 <dc_fixpt_recip+0xc5>
      32c:       48 39 ca                cmp    %rcx,%rdx
      32f:       48 83 d8 ff             sbb    $0xffffffffffffffff,%rax
      333:       48 89 c1                mov    %rax,%rcx
      336:       48 f7 d9                neg    %rcx
      339:       48 85 ff                test   %rdi,%rdi
      33c:       48 0f 49 c8             cmovns %rax,%rcx
      340:       48 89 c8                mov    %rcx,%rax
      343:       5b                      pop    %rbx
      344:       2e e9 00 00 00 00       cs jmp 34a <dc_fixpt_recip+0xba>
      34a:       0f 0b                   ud2
      34c:       0f 0b                   ud2
      34e:       31 c9                   xor    %ecx,%ecx
      350:       e9 57 ff ff ff          jmp    2ac <dc_fixpt_recip+0x1c>
      355:       0f 0b                   ud2
      357:       eb d3                   jmp    32c <dc_fixpt_recip+0x9c>
      359:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

0000000000000360 <.Ltmp40>:
      360:       90                      nop
      361:       90                      nop
      362:       90                      nop
      363:       90                      nop
      364:       90                      nop
      365:       90                      nop
      366:       90                      nop
      367:       90                      nop
      368:       90                      nop
      369:       90                      nop
      36a:       90                      nop
      36b:       90                      nop
      36c:       90                      nop
      36d:       90                      nop
      36e:       90                      nop
      36f:       90                      nop

0000000000000370 <dc_fixpt_sinc>:
      370:       f3 0f 1e fa             endbr64
      374:       e8 00 00 00 00          call   379 <dc_fixpt_sinc+0x9>

(2) objdump info with LLVM mainline version 20.0.0git:

$ clang --version | head -1
clang version 20.0.0git (https://github.com/llvm/llvm-project.git 
8daf4f16fa08b5d876e98108721dd1743a360326)

There is "ud2" instruction at the end of dc_fixpt_recip(), its offset
is "350", this "ud2" instruction is not dead end due to the offset "352"
is in the relocation section '.rela.discard.reachable', that is to say,
dc_fixpt_recip() doesn't end with a return instruction or an
unconditional jump, so objtool determined that the function can fall
through into the next function, thus there is "falls through" objtool
warning.

0000000000000290 <dc_fixpt_recip>:
      290:       f3 0f 1e fa             endbr64
      294:       e8 00 00 00 00          call   299 <dc_fixpt_recip+0x9>
      299:       48 85 ff                test   %rdi,%rdi
      29c:       0f 84 ac 00 00 00       je     34e <dc_fixpt_recip+0xbe>
      2a2:       53                      push   %rbx
      2a3:       48 89 f9                mov    %rdi,%rcx
      2a6:       48 f7 d9                neg    %rcx
      2a9:       48 0f 48 cf             cmovs  %rdi,%rcx
      2ad:       48 b8 00 00 00 00 01    movabs $0x100000000,%rax
      2b4:       00 00 00
      2b7:       31 d2                   xor    %edx,%edx
      2b9:       48 f7 f1                div    %rcx
      2bc:       be e0 ff ff ff          mov    $0xffffffe0,%esi
      2c1:       eb 1b                   jmp    2de <dc_fixpt_recip+0x4e>
      2c3:       45 88 c8                mov    %r9b,%r8b
      2c6:       4d 01 c0                add    %r8,%r8
      2c9:       4d 8d 04 80             lea    (%r8,%rax,4),%r8
      2cd:       48 29 da                sub    %rbx,%rdx
      2d0:       45 88 da                mov    %r11b,%r10b
      2d3:       4c 89 d0                mov    %r10,%rax
      2d6:       4c 09 c0                or     %r8,%rax
      2d9:       83 c6 02                add    $0x2,%esi
      2dc:       74 31                   je     30f <dc_fixpt_recip+0x7f>
      2de:       48 01 d2                add    %rdx,%rdx
      2e1:       45 31 c0                xor    %r8d,%r8d
      2e4:       41 ba 00 00 00 00       mov    $0x0,%r10d
      2ea:       48 39 ca                cmp    %rcx,%rdx
      2ed:       41 0f 93 c1             setae  %r9b
      2f1:       72 03                   jb     2f6 <dc_fixpt_recip+0x66>
      2f3:       49 89 ca                mov    %rcx,%r10
      2f6:       4c 29 d2                sub    %r10,%rdx
      2f9:       48 01 d2                add    %rdx,%rdx
      2fc:       45 31 d2                xor    %r10d,%r10d
      2ff:       48 89 cb                mov    %rcx,%rbx
      302:       48 39 ca                cmp    %rcx,%rdx
      305:       41 0f 93 c3             setae  %r11b
      309:       73 b8                   jae    2c3 <dc_fixpt_recip+0x33>
      30b:       31 db                   xor    %ebx,%ebx
      30d:       eb b4                   jmp    2c3 <dc_fixpt_recip+0x33>
      30f:       48 01 d2                add    %rdx,%rdx
      312:       48 be fe ff ff ff ff    movabs $0x7ffffffffffffffe,%rsi
      319:       ff ff 7f
      31c:       4c 8d 46 01             lea    0x1(%rsi),%r8
      320:       48 39 ca                cmp    %rcx,%rdx
      323:       4c 0f 43 c6             cmovae %rsi,%r8
      327:       4c 39 c0                cmp    %r8,%rax
      32a:       77 1e                   ja     34a <dc_fixpt_recip+0xba>
      32c:       48 39 ca                cmp    %rcx,%rdx
      32f:       48 83 d8 ff             sbb    $0xffffffffffffffff,%rax
      333:       48 89 c1                mov    %rax,%rcx
      336:       48 f7 d9                neg    %rcx
      339:       48 85 ff                test   %rdi,%rdi
      33c:       48 0f 49 c8             cmovns %rax,%rcx
      340:       48 89 c8                mov    %rcx,%rax
      343:       5b                      pop    %rbx
      344:       2e e9 00 00 00 00       cs jmp 34a <dc_fixpt_recip+0xba>
      34a:       0f 0b                   ud2
      34c:       eb de                   jmp    32c <dc_fixpt_recip+0x9c>
      34e:       0f 0b                   ud2
      350:       0f 0b                   ud2
      352:       66 66 66 66 66 2e 0f    data16 data16 data16 data16 cs 
nopw 0x0(%rax,%rax,1)
      359:       1f 84 00 00 00 00 00

0000000000000360 <.Ltmp40>:
      360:       90                      nop
      361:       90                      nop
      362:       90                      nop
      363:       90                      nop
      364:       90                      nop
      365:       90                      nop
      366:       90                      nop
      367:       90                      nop
      368:       90                      nop
      369:       90                      nop
      36a:       90                      nop
      36b:       90                      nop
      36c:       90                      nop
      36d:       90                      nop
      36e:       90                      nop
      36f:       90                      nop

0000000000000370 <dc_fixpt_sinc>:
      370:       f3 0f 1e fa             endbr64
      374:       e8 00 00 00 00          call   379 <dc_fixpt_sinc+0x9>
--------------------------------------------------------------------------

In my opinion, if there is a bug, then it is a generic rather than
arch-specific bug.

The root cause is related with LLVM or Linux kernel? I am not sure
because objtool only checks the object info and reports the warning
"falls through" if the check conditions are true.

tools/objtool/check.c
static int validate_branch(struct objtool_file *file, struct symbol *func,
                            struct instruction *insn, struct insn_state 
state)
{
         struct alternative *alt;
         struct instruction *next_insn, *prev_insn = NULL;
         struct section *sec;
         u8 visited;
         int ret;

         sec = insn->sec;

         while (1) {
                 next_insn = next_insn_to_validate(file, insn);

                 if (func && insn_func(insn) && func != 
insn_func(insn)->pfunc) {
                         /* Ignore KCFI type preambles, which always 
fall through */
                         if (!strncmp(func->name, "__cfi_", 6) ||
                             !strncmp(func->name, "__pfx_", 6))
                                 return 0;

                         WARN("%s() falls through to next function %s()",
                              func->name, insn_func(insn)->name);
                         return 1;
                 }
         ...
}

How to silence the warning when compiling with the latest mainline
LLVM with a proper way? Modify LLVM code or tools/objtool/check.c
or drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c?

Anyway, I think this patch can be independent of this series and can
be sent separately after the "real bug" is fixed, please ignore it now.

Thanks,
Tiezhu

