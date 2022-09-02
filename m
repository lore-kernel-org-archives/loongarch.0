Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF371869
	for <loongarch@lists.linux.dev>; Fri,  2 Sep 2022 13:34:35 +0000 (UTC)
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92.3)
	(envelope-from <daniel@iogearbox.net>)
	id 1oU6oR-00083j-0Y; Fri, 02 Sep 2022 15:34:23 +0200
Received: from [85.1.206.226] (helo=linux-4.home)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1oU6oQ-000UG3-OA; Fri, 02 Sep 2022 15:34:22 +0200
Subject: Re: [PATCH bpf-next v3 0/4] Add BPF JIT support for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev
References: <1661999249-10258-1-git-send-email-yangtiezhu@loongson.cn>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <2219694c-5e4c-2b81-ee39-367467ac0733@iogearbox.net>
Date: Fri, 2 Sep 2022 15:34:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1661999249-10258-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.6/26646/Fri Sep  2 09:55:25 2022)

On 9/1/22 4:27 AM, Tiezhu Yang wrote:
> The basic support for LoongArch has been merged into the upstream Linux
> kernel since 5.19-rc1 on June 5, 2022, this patch series adds BPF JIT
> support for LoongArch.
> 
> Here is the LoongArch documention:
> https://www.kernel.org/doc/html/latest/loongarch/index.html
> 
> With this patch series, the test cases in lib/test_bpf.ko have passed
> on LoongArch.
> 
>    # echo 1 > /proc/sys/net/core/bpf_jit_enable
>    # modprobe test_bpf
>    # dmesg | grep Summary
>    test_bpf: Summary: 1026 PASSED, 0 FAILED, [1014/1014 JIT'ed]
>    test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
>    test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED
> 
> It seems that this patch series can not be applied cleanly to bpf-next
> which is not synced to v6.0-rc3.

For bpf-next tree this doesn't apply cleanly. Huacai, probably easier if you
take it in. Otherwise this needs rebase (and your Ack as arch maintainer), but
then there'll be merge conflict later anyway.

[...]
Applying: LoongArch: Move {signed,unsigned}_imm_check() to inst.h
Applying: LoongArch: Add some instruction opcodes and formats
error: patch failed: arch/loongarch/include/asm/inst.h:18
error: arch/loongarch/include/asm/inst.h: patch does not apply
Patch failed at 0002 LoongArch: Add some instruction opcodes and formats
[...]

Thanks,
Daniel

> v3:
>    -- Remove CONFIG_TEST_BPF in loongson3_defconfig
> 
> v2:
>    -- Rebased series on v6.0-rc3
>    -- Make build_epilogue() static
>    -- Use alsl.d, bstrpick.d, [ld/st]ptr.[w/d] to save some instructions
>    -- Replace move_imm32() and move_imm64() with move_imm() and optimize it
>    -- Add code comments to explain the considerations of conditional jump
>    https://lore.kernel.org/bpf/1661857809-10828-1-git-send-email-yangtiezhu@loongson.cn/
> 
> v1:
>    -- Rebased series on v6.0-rc1
>    -- Move {signed,unsigned}_imm_check() to inst.h
>    -- Define the imm field as "unsigned int" in the instruction format
>    -- Use DEF_EMIT_*_FORMAT to define the same kind of instructions
>    -- Use "stack_adjust += sizeof(long) * 8" in build_prologue()
>    https://lore.kernel.org/bpf/1660996260-11337-1-git-send-email-yangtiezhu@loongson.cn/
> 
> RFC:
>    https://lore.kernel.org/bpf/1660013580-19053-1-git-send-email-yangtiezhu@loongson.cn/
> 
> Tiezhu Yang (4):
>    LoongArch: Move {signed,unsigned}_imm_check() to inst.h
>    LoongArch: Add some instruction opcodes and formats
>    LoongArch: Add BPF JIT support
>    LoongArch: Enable BPF_JIT in default config
> 
>   arch/loongarch/Kbuild                      |    1 +
>   arch/loongarch/Kconfig                     |    1 +
>   arch/loongarch/configs/loongson3_defconfig |    1 +
>   arch/loongarch/include/asm/inst.h          |  383 ++++++++-
>   arch/loongarch/kernel/module.c             |   10 -
>   arch/loongarch/net/Makefile                |    7 +
>   arch/loongarch/net/bpf_jit.c               | 1160 ++++++++++++++++++++++++++++
>   arch/loongarch/net/bpf_jit.h               |  282 +++++++
>   8 files changed, 1830 insertions(+), 15 deletions(-)
>   create mode 100644 arch/loongarch/net/Makefile
>   create mode 100644 arch/loongarch/net/bpf_jit.c
>   create mode 100644 arch/loongarch/net/bpf_jit.h
> 

